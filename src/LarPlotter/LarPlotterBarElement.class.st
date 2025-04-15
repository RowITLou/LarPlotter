"
This class is responsible to plot the entire graph
"
Class {
	#name : #LarPlotterBarElement,
	#superclass : #BlElement,
	#instVars : [
		'graphElement',
		'posX',
		'posY',
		'labelAxisX',
		'labelAxisY',
		'heightLabel',
		'margin',
		'title',
		'container',
		'labelsContainer',
		'containerTickAndLabel',
		'labelsYContainer',
		'ticksYContainer',
		'tickYContainer',
		'plotter'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabelX: elementX [ 
	
	containerTickAndLabel forceLayout. 
    container addChild: elementX.
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabelY:  elementY [
	elementY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
	elementY forceLayout.
	containerTickAndLabel addChildFirst: elementY. 
	containerTickAndLabel forceLayout. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addBars: bars [
bars do: [:bar|

graphElement addChild: bar. ].
graphElement forceLayout.


]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelX: labelsX [

| tickXcontainer |
labelsX do: [:tickXLabel |
 tickXcontainer:= self createContainer.

 tickXcontainer constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal exact:65].
 tickXcontainer addChild: tickXLabel.
labelsContainer addChild: tickXcontainer.].
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelY: labelsY [
|  tickYcontainer |
labelsY do: [:tickYLabel|
tickYcontainer := (LarContainer new initialize) asElementVertical.
tickYcontainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

	tickYcontainer addChild: tickYLabel.
 labelsYContainer addChild: tickYcontainer.]
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksY: ticksY [
ticksY do: [:tickY |
tickYContainer := (LarContainer new initialize) asElementVertical.
tickYContainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

tickYContainer addChild: tickY.
ticksYContainer addChild: tickYContainer.]
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTitle: element [
	container addChild: element at: 5.
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> createContainer [
| containerC |
	containerC := (LarContainer new asElement).
containerC border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
					
^containerC
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> graphElement [
^graphElement
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> initialize: aPlotter [
| empty empty_too  scroll empty_other grid |
plotter := aPlotter.
labelsYContainer := LarContainer new  asElementVertical.
ticksYContainer := LarContainer new  asElementVertical.
graphElement := LarContainer new  asElement.
container := LarContainer new asElementVertical.
containerTickAndLabel :=LarContainer new  asElement.
containerTickAndLabel addChild: labelsYContainer. 
containerTickAndLabel addChild: ticksYContainer. 

super initialize. 
container addChild: graphElement.
grid := BlGridLayoutImpl new.

container layout columnCount: 2.
container layout rowCount: 4.
empty := BlElement new. 
empty_too := BlElement new. 
empty_other := BlElement new. 
container addChildFirst: empty. 
container addChild: containerTickAndLabel at: 2.  
container addChild: empty_too at: 3. 
container addChild: empty_other at: 4.

labelsContainer:= (LarContainer new) asElement.
container addChild: labelsContainer. 
^self 
border: (BlBorder builder

paint: Color white;
					width: 1;
					build);
			background: (Color transparent);
			constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
			background: (BlBackground paint: Color white);
			addChild: container;
			
			 yourself. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> initializeFor [
plotter labelAxisX isNil
ifFalse:[self addAxisLabelX: plotter labelAxisX].
plotter labelAxisY isNil
ifFalse:[self addAxisLabelY: plotter labelAxisX].
plotter bars isNil
ifFalse:[self addBars: plotter bars].
plotter tickLabelsX isNil
ifFalse:[self addTicksLabelX: plotter labelAxisX].
plotter tickLabelsY isNil
ifFalse:[self addTicksLabelY: plotter labelAxisX].
plotter title isNil
ifFalse:[self addTitle: plotter labelAxisX].
plotter ticksX isNil
ifFalse:[self addTicksY: plotter labelAxisX].
plotter ticksY isNil
ifFalse:[self addTicksY: plotter labelAxisX].
]
