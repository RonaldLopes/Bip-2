'''Código criado para interpretação de comandos do BIP2'''

class BipCodeConverter(object):
    def __init__(self,fileName= 'codigo.b2'):
        self.fileName= fileName
        self.variables=[]
        self.data =[]
        self.file = open('codigo.b2', 'r')
    def start(self):
        temp=[]
        for line in self.file:
            line=line.replace('\n','')#.replace(' ','')

            if(line=='.data'):
                temp=[]
                continue
            elif(line=='.text'):
                self.setVariableAddress(temp)
                temp=[]
                continue
            temp.append(line)
        code =self.findProcedure(temp) #procura procedimentos
        self.generateBinaryCode(code)
        # print(self.variables)
        # print(code)
    def generateBinaryCode(self,code):
        listTemp=[]
        opcode=''
        value=''
        file = open('programMemory.list', 'a')
        for cmd in code:
            temp= cmd.split(' ')
            for i in temp:
                if(i != ''):
                    listTemp.append(i)
            opcode,value=self.generateBinaryValues(listTemp)
            print('OP:%s |Value:%s'%(str(opcode),str(value)))
            file.write(opcode+value+'\n')
            listTemp=[]
        # print(len(code))
        # self.completeFile(len(code))
    def completeFile(self,sizeActual,sizeDefault=1024):
        quant= sizeDefault-sizeActual
        file = open('programMemory.list', 'a')
        for i in range(quant):
            file.write(('0'*16)+'\n')
    def generateBinaryValues(self,list):
        # print(list)
        # print(self.variables)
        op=''
        value=self.searchProcedure(list[1])
        if(list[0]=='HLT'):
            op='00000'
        if (list[0] == 'STO'):
            op = '00001'
        if (list[0] == 'LD'):
            op = '00010'
        if (list[0] == 'LDI'):
            op = '00011'
        if (list[0] == 'ADD'):
            op = '00100'
        if (list[0] == 'ADDI'):
            op = '00101'
        if (list[0] == 'SUB'):
            op = '00110'
        if (list[0] == 'SUBI'):
            op = '00111'
        if (list[0] == 'BEQ'):
            op = '01000'
        if (list[0] == 'BNE'):
            op = '01001'
        if (list[0] == 'BGT'):
            op = '01010'
        if (list[0] == 'BGE'):
            op = '01011'
        if (list[0] == 'BLT'):
            op = '01100'
        if (list[0] == 'BLE'):
            op = '01101'
        if (list[0] == 'JMP'):
            op = '01110'
        return op,value
    def searchProcedure(self,search):
        for elemento in self.variables:
            temp=elemento.get(search)
            if(temp!=None):
                # print('Procedimento: %s local: %s'%(str(search),str(temp)))
                return temp
        return self.convertToBinaryFromDec(int(search))
    def findProcedure(self,lista):
        code=[]
        for posicao in range(len(lista)):
            if(lista[posicao].find(':')>=1):
                self.setProcedureAddress(lista[posicao],(posicao-1))
                continue
            code.append(lista[posicao])
        return code
    def setVariableAddress(self,variables):
        # >> > ' '.join(format(ord(x), 'b') for x in st)
        for temp in variables:
            name,value= str(temp).split(':')
            name=name.replace(' ','')
            value= self.convertToBinaryFromDec(int(value))
            self.variables.append({name:str(value)})
    def setProcedureAddress(self,name,value):
        name= str(name).replace(':','').replace(' ', '')
        value= self.convertToBinaryFromDec(value)
        self.variables.append({name:str(value)})
    def convertToBinaryFromHex(self,value):
        value=int(value, 16)#converte de hexadecimal para decimal
        return format(value, 'b') #covnerte para binario
    def convertToBinaryFromDec(self,value):
        # print(value)
        if(value==-1):
            value=int('0',16)
        retorno= format(value, 'b')
        retorno = ((11-len(retorno))*'0')+retorno
        return  retorno#converte para binario

# temp = BipCodeInterpreter()
# temp.start()