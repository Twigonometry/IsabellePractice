class Calculator:
    """simplistic calculator with getResult, clear methods
    could be modelled more like this example: https://gist.github.com/technillogue/5887092"""

    op_chars = ['-','+','*','/']

    def add(self, x, y):
        print(str(x) + " + " + str(y))
        return int(x) + int(y)

    def sub(self, x, y):
        print(str(x) + " - " + str(y))
        return int(x) - int(y)

    def mul(self, x, y):
        print(str(x) + " * " + str(y))
        return int(x) * int(y)

    def div(self, x, y):
        print(str(x) + " - " + str(y))
        return int(x) / int(y)

    def addInput(self, input):
        self.input = input

    def clear(self):
        self.input = ""

    def evaluate(self, tokens):
        print(tokens)
        if len(tokens) is 1:
            return tokens[0]
        for o in self.op_chars:
            """find instances of each operator
            evaluate in reverse order of precedence"""
            try:
                pos = tokens.index(o)

                left = self.evaluate(tokens[:pos])
                right = self.evaluate(tokens[pos + 1:])

                print("Left: " + str(left))
                print("Right: " + str(right))

                if o == "+":
                    return self.add(left, right)
                elif o == "-":
                    return self.sub(left, right)
                elif o == "*":
                    return self.mul(left, right)
                elif o == "/":
                    return self.div(left, right)
            except ValueError:
                pass

        # for t in tokens:
        #     if t.isdigit():
        #         pass
        #     if t in self.op_chars:
        #         try:
        #             pos = tokens.index(t)
        #             left = self.evaluate(tokens[:pos])
        #             right = self.evaluate(tokens[pos + 1:])

        #             print("Left: " + str(left))
        #             print("Right: " + str(right))

        #             if t == "+":
        #                 return self.add(left, right)
        #             elif t == "-":
        #                 return self.sub(left, right)
        #             elif t == "*":
        #                 return self.mul(left, right)
        #             elif t == "/":
        #                 return self.div(left, right)
        #         except ValueError:
        #             pass

    def getResult(self, input):
        """set input to result
        use similar approach to referenced gist - make list of operator characters and evaluate their neighbours"""

        self.input = self.input.replace(" ", "")

        # digs = []
        # ops = []

        tokens = []

        for c in self.input:
            # c = chr(c)
            print(c)
            print(type(c))
            if c.isdigit() or c in self.op_chars:
                tokens.append(c)
            else:
                return("Invalid character detected in input")

        res = self.evaluate(tokens)        
        
        return res

    def __init__(self):
        self.input = ""

        print("Welcome to the calculator!\nType any expression and press enter\nYou can type partial expressions, or type Clear to clear what you have so far\nType Result to get result\nType Quit to exit")

        user_input = input("> ").lower()

        while user_input != "quit":
            if user_input == "result":
                print(str(self.getResult(self.input)))

                self.clear()
            elif user_input == "clear":
                self.input = ""
            else:
                self.input += user_input

                print("Input: " + self.input)

            user_input = input("> ").lower()

if __name__ == '__main__':
    calc = Calculator()