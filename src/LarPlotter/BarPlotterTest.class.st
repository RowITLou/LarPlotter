Class {
	#name : #BarPlotterTest,
	#superclass : #BarPlotter,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
BarPlotterTest >> containerElement [
<gtExample>
| aContainer |
	aContainer := BlElement new
		constraintsDo: [ :c |
			c horizontal exact: self sizeContainer.
			c vertical exact: self sizeContainer ];
		border: (BlBorder paint: Color veryLightGray width: 1).
^aContainer
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> createBars [
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
BarPlotterTest >> createBars: height [
| child |
	child := BlElement new
			background: (Color white alpha: 0.2);
			border: (BlBorder builder
					paint: (Color blue alpha: 0.5);
					width: 1;
					build);
			layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c vertical exact: (4*100)*(height).
		    
			c horizontal matchParent
			].
^child
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> graphElement [
<gtExample>
| parentNew |
	parentNew := BlElement new
			border: (BlBorder builder
					
					paint: Color black;
					width: 3;
					build);
			layout: BlLinearLayout horizontal.
parentNew constraints horizontal exact: self sizeGraph.
parentNew constraints vertical exact: self sizeGraph.
parentNew relocate: self relocateX @ self relocateY.
^parentNew
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> graphTwithLabels [
<gtExample>
| number tickY containerTick aContainer containerTickX tickX |

aContainer := self graphTwithTicks.
number:= self values size.
	
1 to: number do: [: n| 
containerTick := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  10@(self sizeGraph/ number);
		relocate: self relocateX-25 @ (self relocateX+((self sizeGraph/number)*(n-1))-((self sizeGraph/number)/2)).

tickY := BlTextElement new
	
	text: n asRopedText;
	"border: (BlBorder paint: Color black width: 1);"
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTick addChild: tickY.
aContainer addChild: containerTick.].
	"aContainer forceLayout."
	
1 to: number do: [: n| 
containerTickX := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  (self sizeGraph/ number)@10;
		relocate: (self relocateX+((self sizeGraph/number)*(n-1))+((self sizeGraph/number)/2))@(self relocateY +self sizeGraph+15).

tickX := BlTextElement new
	text: n asRopedText;
	"border: (BlBorder paint: Color black width: 1);"
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTickX addChild: tickX.
aContainer addChild: containerTickX.].
	"aContainer forceLayout."
^aContainer
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> graphTwithTicks [
<gtExample>
| number tickY containerTick aContainer containerTickX tickX |
aContainer := self graphWithAxisLabel.
number:= self values size.
	
1 to: number do: [: n| 
containerTick := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  10@(self sizeGraph/ number);
		relocate: self relocateX-10 @ (self relocateX+((self sizeGraph/number)*(n-1))-((self sizeGraph/number)/2)).

tickY := BlElement new
	size: 10@3;
	border: (BlBorder paint: Color black width: 1);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTick addChild: tickY.
aContainer addChild: containerTick.].
	"aContainer forceLayout."
	
1 to: number do: [: n| 
containerTickX := BlElement new
		"border: (BlBorder paint: Color black width: 1);"
		size:  (self sizeGraph/ number)@10;
		relocate: (self relocateX+((self sizeGraph/number)*(n-1))+((self sizeGraph/number)/2))@(self relocateY +self sizeGraph).

tickX := BlElement new
	size: 3@10;
	border: (BlBorder paint: Color black width: 1);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
		
containerTickX addChild: tickX.
aContainer addChild: containerTickX.].
	"aContainer forceLayout."
^aContainer
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> graphWithAxisLabel [
<gtExample>
| labelAxisX aContainer labelAxisY |
	labelAxisX := self labelAxisX.
	
labelAxisY := self labelAxisY.
			
			
aContainer := self graphWithBars.
 
 aContainer addChild: labelAxisX.
  aContainer forceLayout.
  
  
  labelAxisX relocate:self relocateX @ (self relocateY + self sizeGraph + 50).
 
 aContainer addChild: labelAxisY.
  aContainer forceLayout.
 ^aContainer
		
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> graphWithBars [
<gtExample>
| graphElement number child container |
graphElement:= self graphElement.
number := self values size.

1 to: number do: [: n| 
child := self createBars.
child layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c vertical exact: (4*100)*(self values at: n).
		    
			c horizontal matchParent
			].
			
	graphElement addChild: child.].
	graphElement transform
		rotateBy: self rotation;
		apply.
container := self containerElement.
container addChild: graphElement.
^container
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> labelAxisX [
<gtExample>
| labelAxisX labelAxisXTest |
	labelAxisX := BlElement new
		layout: BlLinearLayout horizontal;
		size: self sizeGraph @ self sizeLabel;
		
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
labelAxisX addChild: labelAxisXTest.
^labelAxisX
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> labelAxisY [
<gtExample>
| labelAxisY labelAxisYTest |
	labelAxisY := BlElement new
		layout: BlLinearLayout horizontal;
		size: self sizeGraph @ self sizeLabel;
		
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
labelAxisY relocate: (self relocateX)/2@ self relocateY.
  labelAxisY transform
  	topLeftOrigin
		rotateBy: 90;
		apply.
labelAxisY addChild: labelAxisYTest.
^labelAxisY
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> relocateX [
^100
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> relocateY [
^100
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> rotation [
^180
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> sizeContainer [
^800
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> sizeGraph [
^500
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> sizeLabel [
^50
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> totalGraph [
<gtExample>
| container titel titelContainer |
	container := self graphTwithLabels.
titelContainer := BlElement new
		layout: BlLinearLayout horizontal;
		size: self sizeGraph @ self sizeLabel;
		relocate: self relocateX @ 0;
		constraintsDo: [ :c |
		    c frame vertical alignCenter.
			c frame horizontal alignCenter];
		
		background: (Color gray alpha: 0.3);
		padding: (BlInsets all: 1).

titel := BlTextElement new
		
		text: 'Titel of graph' asRopedText ;
		background: (Color gray alpha: 0.3).

titelContainer addChild: titel.
container addChild: titelContainer. 
^container
 
]

{ #category : #'as yet unclassified' }
BarPlotterTest >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).
]
