cost:: (Int, Int, Int) -> (Int, Int, Int) -> Float

cost (h1, m1, s1) (h2, m2, s2) 

	| ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) == 0 = 0
	
	| ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) <= 180 && ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) > 0 = 0.58
	
	| ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) > 180 = 0.58 + 0.003*fromIntegral(((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1) - 180))
	
	| ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) < 0 && (24*3600 - ((h1*3600 + m1*60 + s1) - (h2*3600 + m2*60 + s2))) <= 180 = 0.58
	
	| ((h2*3600 + m2*60 + s2) - (h1*3600 + m1*60 + s1)) < 0 && (24*3600 - ((h1*3600 + m1*60 + s1) - (h2*3600 + m2*60 + s2))) > 180 = 0.58 + 0.003*fromIntegral((24*3600 - ((h1*3600 + m1*60 + s1) - (h2*3600 + m2*60 + s2))) - 180)
