Class {
	#name : #LarPlotterScatterElement,
	#superclass : #BlElement,
	#instVars : [
		'plotter',
		'titelContainer',
		'labelsYContainer',
		'ticksYContainer',
		'graphElement',
		'axisXContainer',
		'container',
		'containerTickAndLabel',
		'labelsContainer',
		'tickYContainer'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addAxisLabelX: elementX [ 
	
	"containerTickAndLabel forceLayout. "
    axisXContainer addChild: (elementX asElement).
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addAxisLabelY:  labelY [
| elementY cont frame |
"cont := LarContainer new asElement. 
cont constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ]."
	elementY := labelY asElement.
	elementY constraintsDo: [ :c | 
            c accountTransformation.
            c horizontal fitContent.
            c vertical fitContent ].

	elementY  transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
	elementY forceLayout.
	frame := BrFrame new fitContent. 
	frame constraintsDo: [ :c | 
	c grid horizontal alignCenter.
		c grid vertical alignCenter.
            c horizontal fitContent.
            c vertical fitContent ].
	containerTickAndLabel addChildFirst: (frame addChild: elementY).
	
	"containerTickAndLabel addChildFirst: cont. "
	containerTickAndLabel forceLayout. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addLines: lines [
| length height |
	
	labelsYContainer isNil
	ifTrue:[height :=200]
	ifFalse:[height := 150].
graphElement layout cellSpacing: 0.
graphElement constraintsDo: [ :c |
			c horizontal exact: length .
			c vertical exact: height].


lines do: [:line|

graphElement addChild: (line asElement). ].
"graphElement forceLayout."
graphElement transform
		flipX;
		apply.
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addPoints: points [
| length height |
	
	labelsYContainer isNil
	ifTrue:[height :=200]
	ifFalse:[height := 150].
	length := 500.
graphElement layout cellSpacing: 0.
graphElement constraintsDo: [ :c |
			c horizontal exact: length .
			c vertical exact: height].


points do: [:point|

graphElement addChild: (point asElement). ].
"graphElement forceLayout."
graphElement transform
		flipX;
		apply.
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksLabelX: labelsX [

| tickXcontainer |
labelsX do: [:tickXLabel |
 tickXcontainer:= self createContainer.

 tickXcontainer constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal exact:65].
 tickXcontainer addChild: (tickXLabel asElement).
labelsContainer addChild: tickXcontainer.].
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksLabelY: labelsY [
|  tickYcontainer |
labelsY do: [:tickYLabel|
tickYcontainer := (LarContainer new initialize) asElementVertical.
tickYcontainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
    "tickYcontainer constraintsDo: [:c| c vertical matchParent]."
	tickYcontainer addChildFirst: (tickYLabel asElement).
 labelsYContainer addChildFirst: tickYcontainer.]
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksY: ticksY [
ticksY do: [:tickY |
tickYContainer := (LarContainer new initialize) asElementVertical.
tickYContainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

tickYContainer addChild: tickY asElementY.
ticksYContainer addChild: tickYContainer.]
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTitle: element [
	titelContainer addChild: (element asElement).
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> createContainer [
| containerC |
	containerC := (LarContainer new asElement).
containerC border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
					
^containerC
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> graphElement [
^graphElement
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> initialize: aPlotter [
| empty empty_too  scroll empty_other |
plotter := aPlotter.
titelContainer := LarContainer new asElement.
titelContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ].
labelsYContainer := LarContainer new  asElementVertical.
"labelsYContainer constraintsDo: [:c| c vertical matchParent]."
labelsYContainer constraintsDo: [:c| c grid vertical alignBottom. ].
ticksYContainer := LarContainer new  asElementVertical.
graphElement := LarContainer new  asElement.
graphElement constraintsDo: [:c| c grid vertical alignBottom. ].
"graphElement := BlElement new. "


axisXContainer := LarContainer new asElement. 
container := LarContainer new asElementVertical.
containerTickAndLabel :=LarContainer new  asElement.
containerTickAndLabel constraintsDo: [:c| c vertical matchParent].
containerTickAndLabel addChild: labelsYContainer. 
containerTickAndLabel addChild: ticksYContainer. 
axisXContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ].
super initialize. 
"container addChild: graphElement at: 5."
"grid := BlGridLayoutImpl new."

container layout columnCount: 2.
container layout rowCount: 4.
empty := BlElement new. 
empty_too := BlElement new. 
empty_other := BlElement new. 
labelsContainer:= (LarContainer new) asElement.
container addChildFirst: empty. 
container addChild: containerTickAndLabel at: 2.  
container addChild: empty_too at: 3. 
container addChild: empty_other at: 4.
container addChild: titelContainer at: 5.
container addChild: graphElement at: 6.
container addChild: labelsContainer at: 7. 
container addChild: axisXContainer at: 8 .

self initializeFor.

scroll := BlScalableElement new. 
scroll constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
scroll addChild: container.
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
			
			addChild: scroll. 


			
			
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> initializeFor [
plotter labelAxisX isNil
ifFalse:[self addAxisLabelX: plotter labelAxisX].
plotter labelAxisY isNil
ifFalse:[self addAxisLabelY: plotter labelAxisY].
plotter points isNil
ifFalse:[self addPoints: plotter points].
plotter tickLabelsX isNil
ifFalse:[self addTicksLabelX: plotter tickLabelsX].
plotter tickLabelsY isNil
ifFalse:[self addTicksLabelY: plotter tickLabelsY].
plotter title isNil
ifFalse:[self addTitle: plotter title].
plotter ticksX isNil
ifFalse:[self addTicksY: plotter ticksX].
plotter ticksY isNil
ifFalse:[self addTicksY: plotter ticksY].
]
