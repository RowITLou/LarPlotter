"
This class is responsible to plot the entire graph
"
Class {
	#name : #LarPlotterBarElement,
	#superclass : #BlElement,
	#instVars : [
		'graphElement',
		'container',
		'labelsContainer',
		'containerTickAndLabel',
		'labelsYContainer',
		'ticksYContainer',
		'tickYContainer',
		'plotter',
		'titelContainer',
		'axisXContainer'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabelX: elementX [ 
	
	"containerTickAndLabel forceLayout. "
    axisXContainer addChild: (elementX asElement).
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabelY:  labelY [
| elementY cont frame |
cont := LarContainer new asElement. 
cont constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ].
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
	containerTickAndLabel addChild: (frame addChild: elementY).
	
	containerTickAndLabel addChildFirst: cont. 
	containerTickAndLabel forceLayout. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addBars: bars [
bars do: [:bar|
graphElement constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
graphElement addChildFirst: (bar asElement). ].
graphElement forceLayout.
graphElement  transform
  	
		rotateBy: 180;
		apply.

]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelX: labelsX [
	| tickXcontainer aNumber width |
	aNumber := labelsX size.
	aNumber * 65 < 660 & (aNumber * 65 > 600) ifTrue: [ ^ 65 ].
	width := 600 / aNumber.
	labelsX
		do: [ :tickXLabel | 
			tickXcontainer := self createContainer.

			tickXcontainer
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal exact: width ].
			tickXcontainer addChild: tickXLabel asElement.
			labelsContainer addChild: tickXcontainer ]
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelY: labelsY [
	| tickYcontainer scale space height spareLabelYContainer |
	scale := plotter scale.
	space := plotter space.
	height := space * scale.

	labelsY
		do: [ :tickYLabel | 
			tickYcontainer := LarContainer new initialize asElementVertical.
			tickYcontainer
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical exact: height ].

			tickYcontainer addChild: tickYLabel asElement.
			labelsYContainer layout cellSpacing: 0.
			labelsYContainer addChild: tickYcontainer ].


	spareLabelYContainer := LarContainer new initialize asElementVertical
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical exact: height / 2 ].
	spareLabelYContainer layout cellSpacing: 0.
	labelsYContainer addChild: spareLabelYContainer
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksY: ticksY [
	| scale space height |
	scale := plotter scale.
	space := plotter space.
	height := space * scale.

	ticksY
		do: [ :tickY | 
			tickYContainer := LarContainer new initialize asElementVertical.
				
			height := space * scale.
			tickYContainer
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical exact: height ].
			tickYContainer layout cellSpacing: 0.
			tickYContainer addChild: tickY asElementY.
			ticksYContainer addChild: tickYContainer ].
			ticksYContainer constraintsDo: [:c| c grid vertical alignBottom. ].
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTitle: element [
	titelContainer addChild: (element asElement).
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
| empty empty_too  scroll empty_other |
plotter := aPlotter.
titelContainer := LarContainer new asElement.
titelContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ].
labelsYContainer := LarContainer new  asElementVertical.
ticksYContainer := LarContainer new  asElementVertical.
ticksYContainer layout cellSpacing: 0.
graphElement := LarContainer new  asElement.
graphElement constraintsDo: [:c| c grid vertical alignBottom. ].

axisXContainer := LarContainer new asElement. 
container := LarContainer new asElementVertical.
containerTickAndLabel :=LarContainer new  asElement.
containerTickAndLabel constraintsDo: [:c| c grid vertical alignBottom. ].
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
LarPlotterBarElement >> initializeFor [
plotter labelAxisX isNil
ifFalse:[self addAxisLabelX: plotter labelAxisX].
plotter labelAxisY isNil
ifFalse:[self addAxisLabelY: plotter labelAxisY].
plotter bars isNil
ifFalse:[self addBars: plotter bars].
plotter tickLabelsX isNil
ifFalse:[self addTicksLabelX: plotter tickLabelsX].
plotter tickLabelsY isNil
ifFalse:[self addTicksLabelY: plotter tickLabelsY].
plotter title isNil
ifFalse:[self addTitle: plotter title].
"plotter ticksX isNil
ifFalse:[self addTicksY: plotter ticksX]."
plotter ticksY isNil
ifFalse:[self addTicksY: plotter ticksY].
]
