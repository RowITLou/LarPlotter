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
LarBarElement >> create: sizeHight with: sizeWidth [
| child |
width := sizeWidth.
hight := sizeHight.
child := BlElement new
			background: (Color white alpha: 0.2);
			size: width @ hight;
			border: (BlBorder builder
					paint: (Color blue alpha: 0.5);
					width: 1;
					build).
^child
]
