 def := list("You will have a bad day.")
def append("A good way to keep healthy is to eat more Chinese food.") append("Hard work pays off in the future, laziness pays off now.") append("Maybe.") append("Sure, why not?")

anyOne := method(ls, 
	r := Random clone;
	return ls at(r value(ls size() round))
)

startsWith := method(str, char, 
	return str at(0) == char
)

specReadLines := method(file,
	l := file readLines
	l foreach(v, if(startsWith(v, "%"), l remove(v)))
	return l
)

fortune := method(str,
	f := if((str == nil) not, File clone with(str), nil)
	if((f == nil) not,
		f openForReading
		lns := specReadLines(f)
	)
	writeln(if(f == nil, anyOne(def), anyOne(lns)))
)

if(System args size == 1, fortune(nil), if(System args size() > 2, "required one argument, custom fortune file path.", fortune(System args at(1))))

