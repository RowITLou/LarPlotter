Class {
	#name : #BarPlotterExamples,
	#superclass : #BarPlotter,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
BarPlotterExamples >> containerElement [
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
BarPlotterExamples >> createBars [
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
BarPlotterExamples >> createBars: height [
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
BarPlotterExamples >> graphElement [
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
BarPlotterExamples >> graphWithAxisLabel [
<gtExample>
| labelAxisX labelAxisXTest aContainer labelAxisY labelAxisYTest |
	labelAxisX := BlElement new
		layout: BlLinearLayout horizontal;
		size: 500 @ 50;
		
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
			
			
aContainer := self graphWithBars.
 labelAxisX addChild: labelAxisXTest.
 aContainer addChild: labelAxisX.
  aContainer forceLayout.
   labelAxisY relocate: (self relocateX)/2@ self relocateY.
  labelAxisY transform
  	topLeftOrigin
		rotateBy: 90;
		apply.
  
  labelAxisX relocate:self relocateX @ (self relocateY + self sizeGraph + 50).
 labelAxisY addChild: labelAxisYTest.
 aContainer addChild: labelAxisY.
  aContainer forceLayout.
  ^aContainer
		
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphWithBars [
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
BarPlotterExamples >> relocateX [
^100
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> relocateY [
^100
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> rotation [
^180
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> sizeContainer [
^800
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> sizeGraph [
^500
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> sizeLabel [
^50
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).
]
