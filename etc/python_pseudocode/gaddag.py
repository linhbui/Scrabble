class Node:
    def __init__(self, letter):
        self.letter = letter
        self.next = {}
        self.final = False

    def add(self, word):
        if not word:
            self.final = True
        else:
            letter = word[0]
            rest = word[1:]
            if letter not in self.next.keys():
                self.next[letter] = Node(letter)
            self.next[letter].add(rest)

    def exists(self, frag):
        if not frag:
            return True
        else:
            letter = frag[0]
            rest = frag[1:]
            if letter not in self.next.keys():
                return False
            else:
                return self.next[letter].exists(rest)

    def dfs(self, frag, word, prepend):
        if self.letter == "!":
            return [self.next[k].dfs(frag, word, False)
                    for k in self.next.keys()]
        elif not frag:
            wordList = []
            if prepend:
                word = self.letter + word
            else:
                word = word + self.letter
            if self.final:
                wordList.append(word)
            return wordList + [self.next[k].dfs(frag, word, prepend)
                    for k in self.next.keys()]
        else:
            return self.next[frag[0]].dfs(frag[1:], self.letter + word, True)


class Gaddag:
    def __init__(self):
        self.root = Node("")
        self.num = 0

    def add(self, word):
        self.num += 1
        print(self.num)
        for i in range(len(word) - 1):
            self.root.add(word[i::-1] + "!" + word[i+1:])
        self.root.add(word[::-1])

    def list(self, frag):
        wordList = []
        if self.root.exists(frag[::-1]):
            self.flatten(self.root.dfs(frag[::-1], "", True), wordList)
        return wordList

    def flatten(self, lst, top):
        for item in lst:
            if type(item) is list:
                self.flatten(item, top)
            else:
                top.append(item)


gaddag = Gaddag()

for line in open("dict.txt", "r"):
    word = line.split()[0]
    gaddag.add(word)

print("")
print("total " + str(gaddag.num) + " words")

print("")
print("from cat:")
print(gaddag.list("cat"))

print("")
print("from ple:")
print(gaddag.list("ple"))

print("")
print("from apt:")
print(gaddag.list("apt"))
