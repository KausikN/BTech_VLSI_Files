#--Imports------------------------------------------------------------------
import re
#---------------------------------------------------------------------------

#--Initialisations----------------------------------------------------------

display_Recursions = False

display_wires = True
display_gates = False

fields = ['Verilog Code Location (with filename and filepath)']

inputfileloc = ''# 'ActivityFactorComputer/Inputs/'
modulename = ''

gates_names = ['nand', 'nor', 'and', 'or', 'xor', 'not', 'buf']
alternate_gates_names = {}
alternate_gates_names['nand'] = ['nand', 'NA', 'NAND']
alternate_gates_names['nor'] = ['nor', 'NO', 'NOR']
alternate_gates_names['and'] = ['and', 'AND']
alternate_gates_names['or'] = ['or', 'OR']
alternate_gates_names['xor'] = ['xor', 'XOR']
alternate_gates_names['not'] = ['not', 'NOT', 'IN']
alternate_gates_names['buf'] = ['buf', 'BU']

inputs_names = []
outputs_names = []
wires_names = []

class Gate:
    def __init__(self, gate, name, inp, out):
        self.gate = gate
        self.name = name
        self.inp = inp
        self.out = out

class Wire:
    def __init__(self, name, w_type, inp_gates, out_gates, activityFactor_Prob):
        self.name = name
        self.w_type = w_type
        self.inp_gates = inp_gates
        self.out_gates = out_gates
        self.activityFactor_Prob = activityFactor_Prob

gates = []
wires = []

n_inputs = 0
n_outputs = 0
n_wires = 0


#---------------------------------------------------------------------------

#--Functions----------------------------------------------------------------
#--1--
def fetch_inputs(fields):
    global inputfileloc

    input_dict = {}

    for field in fields:
        text  = input(field + ": ")
        input_dict[field] = text
    if (not (input_dict == {})):
        print(input_dict)

    if input_dict != {} and input_dict["Verilog Code Location (with filename and filepath)"] != '':
        inputfileloc += input_dict["Verilog Code Location (with filename and filepath)"]

    VerilogParser(filepath=inputfileloc)

#--2--
def FileContents(filepath):
    return open(filepath, "r").read()

def RemoveCommentsAndEmptyLines(contents):
    new_contents = ""
    commented_block = False
    for line in contents:
        if (re.search('^\/\*.*', line)):
            commented_block = True
        if (re.search('^\*\/.*', line)):
            commented_block = False
        if (not (line == "") and not re.search('^\/\/.*', line) and not commented_block):
            if  re.search('.*\/\/.*', line):
                uncommented = re.findall('^(.*)\/\/.*', line)[0]
                if (not (uncommented == "")):
                    new_contents += uncommented.strip()
            else:
                new_contents += line.strip()
            
    return new_contents

def GetGateNames(gate_type):
    global gates_names
    global alternate_gates_names
    for gn in gates_names:
        for gt in alternate_gates_names[gn]:
            if re.search('^' + gt + '.*', gate_type):
                return gt
    return 'buf'

#--3--
def VerilogParser(filepath):
    global modulename
    global inputs_names
    global outputs_names
    global wires_names
    global wires
    global n_inputs
    global n_outputs
    global n_wires

    contents = FileContents(filepath)

    contents = RemoveCommentsAndEmptyLines(contents.split('\n'))

    # print(contents)

    contents = contents.split(';')

    #print("; CONTENTS:\n", contents)
    # for iii in contents:
    # 	print(iii)

    for line in contents:
        if (line == ""):
            continue
        # print("Line: ", line)
        # Get Module Name
        if re.search('^\s*module\s+', line):
            modulename = re.findall('^\s*module\s+(.*)\(', line)[0].strip()
        # Get Module Name

        # Get Inputs
        if re.search('^\s*input\s+', line):
            inputs_names = re.findall('^\s*input\s+(.*)', line)[0].strip().split(',')
            InitWires(inputs_names, 'i')
            n_inputs = len(inputs_names)
        # Get Inputs

        # Get Outputs
        if re.search('^\s*output\s+', line):
            outputs_names = re.findall('^\s*output\s+(.*)', line)[0].strip().split(',')
            InitWires(outputs_names, 'o')
            n_outputs = len(outputs_names)
        # Get Outputs

        # Get Wires
        if re.search('^\s*wire\s+', line):
            wires_names = re.findall('^\s*wire\s+(.*)', line)[0].strip().split(',')
            InitWires(wires_names, 'w')
            n_wires = len(wires_names)
        # Get Wires

        # Parse Connections
        FindConnection(line)
        # Parse Connections

    # Compute Activity Factor_Probs
    global display_Recursions
    for o in wires:
        if (o.w_type == 'o'):
            if (display_Recursions):
                print("---------------------------S ", o.name, "----------------------------------\n")
            Recursive_Compute(o, 0)
            if (display_Recursions):
                print("\n---------------------------E ", o.name, "----------------------------------\n\n\n")
    # Compute Activity Factor_Probs

    # Print
    if (display_gates):
        PrintGates()
    if (display_wires):
        PrintWires()
    # Print

    # Print Output Activity Factor_Probs
    print("--------------Output Activity Factor_Probs----------------")
    for o in wires:
        if (o.w_type == 'o'):
            print("Output Name: ", o.name, " - Prob: ", o.activityFactor_Prob, " - Activity Factor: ", o.activityFactor_Prob*(1-o.activityFactor_Prob))
    print("-----------------------------------------------------")
    # Print Output Activity Factor_Probs


def InitWires(wires_names, w_type):
    global wires
    for w in wires_names:
        if (w_type == 'i'):
            wires.append(Wire(w.strip(), w_type, [], [], 0.5))
        else:
            wires.append(Wire(w.strip(), w_type, [], [], -1.0))


def FindConnection(line):
    global gates_names
    global gates
    global wires
    global alternate_gates_names

    # print(line)
    
    for gn_main in gates_names:
        for gn in alternate_gates_names[gn_main]:
            if re.search('^\s*' + gn + '\s+', line):										# Eg. nand NAND2_1 (N10, N1, N3)
                all_text = re.findall('^\s*' + gn + '\s+(.*)', line)[0].strip()				# NAND2_1 (N10, N1, N3)
                instance_name = re.findall('(.*)\s*\(', all_text)[0].strip()				# NAND2_1
                all_wires = re.findall('.*\s*\((.*)\)', all_text)[0].strip().split(',')		# [N10, N1, N3]
                # As only 1 output which is at last index of all_wires
                inp_names = all_wires[1:]													# [N10, N1]
                out_names = [all_wires[0].strip()]											# [N3]
                inp = []
                out = []

                index = 0
                for w in wires:
                    for i in inp_names:
                        if (w.name == i.strip()):
                            inp.append(w)

                    for o in out_names:
                        if (w.name == o.strip()):
                            out.append(w)

                    index += 1
                
                new_gate = Gate(GetGateNames(gn), instance_name, inp, out)
                gates.append(new_gate)

                index = 0
                for w in wires:
                    for i in inp_names:
                        if (w.name == i.strip()):
                            wires[index].out_gates.append(new_gate)
                            # print("COMPARE_TRUE: |" + w.name + "| and |" + i.strip() + "|")
                        # else :
                        # 	print("COMPARE: |" + w.name + "| and |" + i.strip() + "|")
                    for o in out_names:
                        if (w.name == o.strip()):
                            wires[index].inp_gates.append(new_gate)
                            # print("COMPARE_TRUE: |" + w.name + "| and |" + o.strip() + "|")
                        # else :
                        # 	print("COMPARE: |" + w.name + "| and |" + o.strip() + "|")

                    index += 1

                return

def PrintWires():
    global wires
    index = 0
    for w in wires:
        # print("Wire ", index, ": ", w.name, " - ", w.w_type, " - i: ", len(w.inp_gates), " - o: ", len(w.out_gates), " - actFactor_Prob: ", w.activityFactor_Prob)
        print("Wire ", index, ": ", w.name, " - ", w.w_type, " - actFactor_Prob: ", w.activityFactor_Prob, " - Activity Factor: ", (w.activityFactor_Prob*(1-w.activityFactor_Prob)))

        index += 1

def PrintGates():
    global gates
    index = 0
    for g in gates:
        print("Gate ", index, ": ", g.gate, " - ", g.name, " - i: ", len(g.inp), " - o: ", len(g.out))

        index += 1

def ComputeGateActivityFactor_Prob(gate):
    actFactor_Prob = 1

    if (gate.gate == 'and'):
        for i in gate.inp:
            actFactor_Prob *= i.activityFactor_Prob
    elif (gate.gate == 'buf'):
        actFactor_Prob = gate.inp[0].activityFactor_Prob
    elif (gate.gate == 'not'):
        actFactor_Prob = 1 - gate.inp[0].activityFactor_Prob
    elif (gate.gate == 'or'):
        for i in gate.inp:
            actFactor_Prob *= (1 - i.activityFactor_Prob)
        actFactor_Prob = 1 - actFactor_Prob
    elif (gate.gate == 'nand'):
        for i in gate.inp:
            actFactor_Prob *= i.activityFactor_Prob
        actFactor_Prob = 1 - actFactor_Prob
    elif (gate.gate == 'nor'):
        for i in gate.inp:
            actFactor_Prob *= (1 - i.activityFactor_Prob)
    elif (gate.gate == 'xor'):
        n_w = len(gate.inp)
        actFactor_Prob = (gate.inp[0].activityFactor_Prob * (1 - gate.inp[1].activityFactor_Prob)) + ((1 - gate.inp[0].activityFactor_Prob) * gate.inp[1].activityFactor_Prob)
        for i in range(2, n_w):
            old_act = actFactor_Prob
            actFactor_Prob = (gate.inp[i].activityFactor_Prob * (1 - actFactor_Prob)) + ((1 - gate.inp[i].activityFactor_Prob) * actFactor_Prob)
        
    return actFactor_Prob


def Recursive_Compute(wire, depth):
    global wires
    global gates
    global display_Recursions

    if (display_Recursions):
        print("---------S depth = ", depth, "----------------")

    index = 0

    it_index = 0
    for w in wires:
        if (w.name == wire.name):
            index = it_index
        it_index += 1

    if (display_Recursions):
        print("Recursion: Current Wire ", index, ": ", wire.name, " - ", wire.w_type, " - i: ", len(wire.inp_gates), " - o: ", len(wire.out_gates), " - actFactor_Prob: ", wire.activityFactor_Prob)

    if (len(wires[index].inp_gates) > 0):
        connected_gate = wires[index].inp_gates[0]
        if (display_Recursions):
            print("Recursive Gate: ", connected_gate.gate, " - ", connected_gate.name)
        
        for i in connected_gate.inp:
            if (i.activityFactor_Prob == -1.0):
                if (display_Recursions):
                    print("Recursive Wire: ", i.name, " - ", i.activityFactor_Prob)
                Recursive_Compute(i, depth+1)
            if (display_Recursions):
                print("Recursion Wire Done: ", i.name, " - ", i.activityFactor_Prob)
        wires[index].activityFactor_Prob = ComputeGateActivityFactor_Prob(connected_gate)
    
    if (display_Recursions):
        print("---------E depth = ", depth, "----------------")



            
                
    
    
    
#---------------------------------------------------------------------------

#--Main Code----------------------------------------------------------------

fetch_inputs(fields)

