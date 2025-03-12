Class {
	#name : #LarBarElement,
	#superclass : #BlElement,
	#instVars : [
		'hight',
		'width'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarBarElement >> create: sizeHight [ 
hight := sizeHight.
super initialize.

^self
		background: (Color white);
		border: (BlBorder builder
				paint: (Color blue alpha: 0.5);
				width: 1;
				build);
				layout: BlFrameLayout new;
		constraintsDo: [ :c | 
		 c vertical exact: (sizeHight).
		    
	    c horizontal matchParent
			]; yourself.
]

{ #category : #'as yet unclassified' }
LarBarElement >> create: sizeHight with: sizeWidth [
hight := sizeHight.
super initialize.

^self
		background: (Color white);
		border: (BlBorder builder
				paint: (Color blue alpha: 0.5);
				width: 1;
				build);
				layout: BlFrameLayout new;
		constraintsDo: [ :c | 
		 c vertical exact: (sizeHight).
		    
	    c horizontal exact: sizeWidth
			]; yourself.
]
