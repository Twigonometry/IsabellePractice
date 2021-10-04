from cmd import Cmd

class Calculator:
    """simplistic calculator with getResult, clear methods
    could be modelled more like this example: https://gist.github.com/technillogue/5887092"""

    def add(self, x, y):
        return x + y

    def sub(self, x, y):
        return x - y

    def mul(self, x, y):
        return x * y

    def div(self, x, y):
        return x / y

    def addInput(self, input):
        self.input = input

    def clear(self):
        self.input = ""

    def getResult(self, input):
        """set input to result"""
        return True

    def __init__(self):
        self.input = ""

        print("Welcome to the calculator!\nType any expression and press enter\nYou can type partial expressions, or type Clear to clear what you have so far\nType Result to get result\nType Quit to exit")

        user_input = input("> ").lower()

        while user_input != "quit":
            if user_input == "result":
                self.getResult(self.input)

                self.clear()
            elif user_input == "clear":
                self.input = ""
            else:
                self.input += user_input

                print("Input: " + self.input)

            user_input = input("> ").lower()

if __name__ == '__main__':
    calc = Calculator()