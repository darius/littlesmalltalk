"
Print the accumulated call counts for all methods of this class and all its subclasses.
Start lst4 (from the call-count-profiler branch) with a fresh image.
Run your benchmark.
Then execute:
     Object dumpProfiles
This is a quick hack -- obviously it could be made more convenient.
"
!Class
dumpProfiles
        self methods do: [:m | m callCount print. $  print. self print. $  print. m name printNl].
	globals do: [ :obj |
		((obj isKindOf: Class) and: [ obj superclass == self])
			ifTrue: [
                                obj dumpProfiles
                        ]
        ]
!
