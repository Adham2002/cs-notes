class Garden:
    def __init__(self, file_name: str = 'a-12-test.txt'):
        self.garden: list[list[str]] = []
        self.regions: dict[str, tuple[int, int]] = {}
        self.num_plots: int = 0
        
        self.populate(file_name)
        self.partition()
        #self.calc_cost()

    def populate(self, file_name):
        with open(file_name, "r") as f:
            for line in f:
                self.garden.append(list(line.rstrip()))
        self.num_plots = len(self.garden) * len(self.garden[0])
    
    def partition(self):
        num_rows: int = len(self.garden)
        num_cols: int = len(self.garden[0])
        untouched: set = set([(i,j) for j in range(num_rows) for i in range(num_cols)])
        while untouched:
            new_reg = untouched.pop()

    def expand(self):
        pass
    
    def calc_cost(self):
        pass


g = Garden()
print(g.garden)
print(g.num_plots)
print(g.regions)
#print(g.calc_cost)