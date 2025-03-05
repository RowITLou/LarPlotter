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
	"container := self containerElement: 700.
	container addChild: graphElement."
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

{ #category : #'as yet unclassified' }
BarPlotter >> labelAxisX: sizeGraph with: sizeLabel with: relocate [
| labelAxisX labelAxisXTest |
	labelAxisX := BlElement new
		layout: BlLinearLayout horizontal;
		size:  sizeGraph @  sizeLabel;
		
		constraintsDo: [ :c |
		    c frame vertical alignCenter.
			c frame horizontal alignCenter];
		background: (Color gray alpha: 0.3);
		padding: (BlInsets all: 1).
		
labelAxisXTest := BlTextElement new
		
		text: 'Name of Axis x' asRopedText ;
		background: (Color gray alpha: 0.3);
constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignCenter.
			c ignored horizontal alignCenter ].
labelAxisX relocate: relocate @ (sizeGraph + relocate + 50).
labelAxisX addChild: labelAxisXTest.
^labelAxisX
]

{ #category : #'as yet unclassified' }
BarPlotter >> labelAxisY: sizeGraph with: sizeLabel with: relocate [
| labelAxisY labelAxisYTest |
	labelAxisY := BlElement new
		layout: BlLinearLayout horizontal;
		size: sizeGraph @ sizeLabel;
		
		constraintsDo: [ :c |
		    c frame vertical alignCenter.
			c frame horizontal alignCenter];
		background: (Color gray alpha: 0.3);
		padding: (BlInsets all: 1).
		
labelAxisYTest := BlTextElement new
		
		text: 'Name of Axis Y' asRopedText ;
		background: (Color gray alpha: 0.3);
constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignCenter.
			c ignored horizontal alignCenter ].
labelAxisY relocate: ( relocate)/2@  relocate.
  labelAxisY transform
  	topLeftOrigin
		rotateBy: 90;
		apply.
labelAxisY addChild: labelAxisYTest.
^labelAxisY
]

{ #category : #'as yet unclassified' }
BarPlotter >> labelTicksX: number with: sizeGraph with: relocate [
| containerTickX tickX collection |
collection := OrderedCollection new.
	1 to: number do: [: n| 
containerTickX := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  ( sizeGraph/ number)@10;
		relocate: ( relocate+(( sizeGraph/number)*(n-1))+(( sizeGraph/number)/2))@( relocate + sizeGraph+15).

tickX := BlTextElement new
	text: n asRopedText;
	"border: (BlBorder paint: Color black width: 1);"
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTickX addChild: tickX.
collection add: containerTickX.].
^collection
]

{ #category : #'as yet unclassified' }
BarPlotter >> labelTicksY: number with: sizeGraph with: relocate [
| containerTick tickY collection |
collection := OrderedCollection new.
	1 to: number do: [: n| 
containerTick := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  10@( sizeGraph/ number);
		relocate:  relocate-25 @ ( relocate+(( sizeGraph/number)*(n-1))-(( sizeGraph/number)/2)).

tickY := BlTextElement new
	
	text: n asRopedText;
	"border: (BlBorder paint: Color black width: 1);"
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTick addChild: tickY.
collection add: containerTick.].
^collection
]

{ #category : #'as yet unclassified' }
BarPlotter >> ticksAxisX: number with: sizeGraph with: relocate [
| container containerTickX tickX |
	container := OrderedCollection new.
1 to: number do: [: n| 
containerTickX := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  ( sizeGraph/ number)@10;
		relocate: ( relocate+(( sizeGraph/number)*(n-1))+(( sizeGraph/number)/2))@( relocate + sizeGraph).

tickX := BlElement new
	size: 3@10;
	border: (BlBorder paint: Color black width: 1);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTickX addChild: tickX.
container add: containerTickX.].
^container
]

{ #category : #'as yet unclassified' }
BarPlotter >> ticksAxisY: number with: sizeGraph with: relocate [
| collection containerTick tickY |
	collection := OrderedCollection new.
1 to: number do: [: n| 
containerTick := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  10@( sizeGraph/ number);
		relocate:  relocate-10 @ ( relocate+(( sizeGraph/number)*(n-1))-(( sizeGraph/number)/2)).
		
tickY := BlElement new
	size: 10@3;
	border: (BlBorder paint: Color black width: 1);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
containerTick addChild: tickY.
collection add: containerTick.].
^collection

]

{ #category : #'as yet unclassified' }
BarPlotter >> titelGraph: sizeGraph with: sizeLabel with: relocate [
| titel titelText |
	titel := BlElement new
		layout: BlLinearLayout horizontal;
		size:  sizeGraph @  sizeLabel;
		
		constraintsDo: [ :c |
		    c frame vertical alignCenter.
			c frame horizontal alignCenter];
		background: (Color gray alpha: 0.3);
		padding: (BlInsets all: 1).
titelText := BlTextElement new
		
		text: 'Name of Graph' asRopedText ;
		background: (Color gray alpha: 0.3);
constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignCenter.
			c ignored horizontal alignCenter ].
titel addChild: titelText. 
titel relocate: relocate@0. 
^titel
]
