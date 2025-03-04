Class {
	#name : #BarPlotter,
	#superclass : #Object,
	#category : #'LarPlotter-Plots'
}

{ #category : #'as yet unclassified' }
BarPlotter >> barElement [
| child |
	child := BlElement new
			background: (Color white alpha: 0.2);
			border: (BlBorder builder
					paint: (Color blue alpha: 0.5);
					width: 1;
					build).
^child
]

{ #category : #'as yet unclassified' }
BarPlotter >> barsInGraph: values with: sizeGraph with: relocate [
| graphElement number child |
graphElement:= self graphElement: sizeGraph with: relocate.
number := values size.

1 to: number do: [: n| 
child := self barElement.
child layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c vertical exact: (4*100)*(values at: n).
		    
			c horizontal matchParent
			].
			
	graphElement addChild: child.].
	graphElement transform
		rotateBy: 180;
		apply.
^graphElement
]

{ #category : #'as yet unclassified' }
BarPlotter >> containerElement: sizeContainer [ 
<gtExample>
	| aContainer |
	aContainer := BlElement new
		constraintsDo: [ :c |
			c horizontal exact:  sizeContainer.
			c vertical exact:  sizeContainer ];
		border: (BlBorder paint: Color veryLightGray width: 1).
^aContainer
]

{ #category : #'as yet unclassified' }
BarPlotter >> graphElement: sizeGraph with: relocate [
| parentNew |
	parentNew := BlElement new
			border: (BlBorder builder
					
					paint: Color black;
					width: 3;
					build);
			layout: BlLinearLayout horizontal.
parentNew constraints horizontal exact: sizeGraph.
parentNew constraints vertical exact: sizeGraph.
parentNew relocate: relocate@relocate.
^parentNew
]
