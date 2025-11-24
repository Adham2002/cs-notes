########################
# Advanced Collections #
########################
# https://docs.python.org/3/library/collections.html#chainmap-objects
import collections
import collections.abc

collections.namedtuple()        #factory function for creating tuple subclasses with named fields
collections.deque()             # list-like container with fast appends and pops on either end
collections.ChainMap()          # dict-like class for creating a single view of multiple mappings
collections.Counter()           # dict subclass for counting hashable objects
collections.OrderedDict()       # dict subclass that remembers the order entries were added
collections.defaultdict()       # dict subclass that calls a factory function to supply missing values
collections.UserDict()          # wrapper around dictionary objects for easier dict subclassing
collections.UserList()          # wrapper around list objects for easier list subclassing
collections.UserString()        # wrapper around string objects for easier string subclassing


collections.abc.Iterator