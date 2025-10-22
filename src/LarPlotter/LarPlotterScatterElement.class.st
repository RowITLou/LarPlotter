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
		'tickYContainer',
		'containerTickAndLabelX',
		'tickXContainer'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addAxisLabelX: elementX [ 
	
	
    axisXContainer addChild: (elementX asElement).
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addAxisLabelY:  labelY [
| elementY  frame cont |
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
	containerTickAndLabel addChildFirst: (frame addChild: elementY).
	
	containerTickAndLabel addChildFirst: cont. 
	containerTickAndLabel forceLayout. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addPoints: points [
graphElement constraintsDo: [ :c |
			c horizontal exact: 600 .
			c vertical exact: 500].
		
points do: [:point|

graphElement addChildFirst: (point asElement).].

graphElement forceLayout.
graphElement transform
		flipX;
		apply.
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksLabelX: labelsX [
	| tickXcontainer aNumber width |
	aNumber := labelsX size.

	width := 600 / aNumber.
	labelsX
		do: [ :tickXLabel | 
			| frame_t frame_s|
					tickXcontainer := LarContainer new asElement.
					tickXcontainer
						constraintsDo: [ :c | 
							c vertical fitContent.
							c horizontal exact: width ].
					tickXcontainer addChild: tickXLabel asElement.
					plotter angleX == 0
						ifFalse: [ tickXcontainer := self angleX: tickXcontainer with: width ].
					frame_s := LarContainer new asElement.
					frame_s
						constraintsDo: [ :c | 
							c vertical fitContent.
							c horizontal exact: width ];
							clipChildren: false.
			
					frame_s addChild: tickXcontainer.
					
					labelsContainer clipChildren: false.
					labelsContainer addChild: frame_s ] 
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksLabelY: labelsY [
	| tickYcontainer scale space height |
	scale := plotter dict at: 'data' at: 'scale_two'.
	space := plotter dict at: 'data' at: 'space_two'.
	height := space * scale.

	labelsY
		do: [ :tickYLabel | 
		|frame_s|
			tickYcontainer := LarContainer new initialize asElementVertical. 
					tickYcontainer
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical exact: height ].

					tickYcontainer addChild: tickYLabel asElement.
					labelsYContainer layout cellSpacing: 0.

					plotter angleY == 0
						ifFalse: [ tickYcontainer := self angleY: tickYcontainer with: height].
					frame_s := LarContainer new asElement.
					frame_s
						constraintsDo: [ :c | 
							c vertical exact: height.
							c horizontal fitContent ];
							clipChildren: false.
					frame_s addChild: tickYcontainer.
					labelsYContainer clipChildren: false.
					labelsYContainer addChild: frame_s  ].

	self smallAdding: height
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksX: ticksX [
| scale space height |
	scale := plotter scale_two.
	space := plotter space_two.
	height := (space * scale).

	ticksX
		do: [ :tickY | 
			tickYContainer := LarContainer new initialize asElementVertical.
			tickYContainer
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical exact: height ].
			tickYContainer layout cellSpacing: 0.
			tickYContainer addChild: (tickY asElementY).
			ticksYContainer addChild: tickYContainer ].
			ticksYContainer constraintsDo: [:c| c grid vertical alignBottom. ].
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> addTicksY: ticksY [
	| scale space height |
	scale := plotter dict at: 'data' at: 'scale_two'.
	space := plotter dict at: 'data' at: 'space_two'.
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
LarPlotterScatterElement >> addTitle: element [
	titelContainer addChild: (element asElement).
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> angleX: tickXcontainer with: width [
	| frame_t |
	tickXcontainer
		constraintsDo: [ :c | 
			c accountTransformation.
			c horizontal fitContent];
			clipChildren: false.
		plotter angleX <0 
		ifTrue:[tickXcontainer layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c frame vertical alignTop.
			c frame horizontal alignRight
			].
			tickXcontainer constraintsDo: [ :c | 
			c grid horizontal alignRight. ].]
			
			
			ifFalse:[tickXcontainer layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c frame vertical alignTop.
			c frame horizontal alignLeft
			].].
		
	tickXcontainer transform
		rotateBy: plotter angleX;
		apply.
	frame_t := BrFrame new.
	
	frame_t
		constraintsDo: [ :c | 
			c horizontal exact: (width*3/5).
			c vertical exact: width.
		 ];
			clipChildren: false.
	
	plotter angleX <0 
	ifTrue:[frame_t layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c frame vertical alignCenter.
			c frame horizontal alignLeft
			].]
			ifFalse:[frame_t layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c frame vertical alignCenter.
			c frame horizontal alignRight].
			frame_t constraintsDo: [ :c | 
			c grid horizontal alignRight ]].
	
	frame_t addChild: tickXcontainer.
	
	^frame_t
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> angleY: tickXcontainer with: height [
	| frame_t size |
	tickXcontainer
		constraintsDo: [ :c | 
			c accountTransformation.
			c vertical fitContent	"c grid horizontal alignCenter.
			c grid vertical alignCenter" ].
	size := tickXcontainer size x.
	plotter angleY < 0
			ifTrue: [ tickXcontainer
					layout: BlFrameLayout new;
					constraintsDo: [ :c | 
						c frame vertical alignBottom.
						c frame horizontal alignRight ] ]
			ifFalse: [ tickXcontainer
					layout: BlFrameLayout new;
					constraintsDo: [ :c | 
						c frame vertical alignTop.
						c frame horizontal alignRight ] ].	"tickXcontainer layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c frame vertical alignTop.
		    
			c frame horizontal alignRight
			]."	"clipChildren: false."
	tickXcontainer transform
		rotateBy: plotter angleY;
		apply.
	frame_t := BrFrame new.
	frame_t
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical exact: (size * 16 / 5) ];
		clipChildren: false.
	plotter angleY < 0
		ifTrue: [ frame_t
				layout: BlFrameLayout new;
				constraintsDo: [ :c | 
					c frame vertical alignTop.
					c frame horizontal alignRight ] ]
		ifFalse: [ frame_t
				layout: BlFrameLayout new;
				constraintsDo: [ :c | 
					c frame vertical alignCenter.
					c frame horizontal alignRight ].
			frame_t constraintsDo: [ :c | c grid vertical alignCenter ] ].
	frame_t addChild: tickXcontainer.

	^ frame_t
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
labelsYContainer constraintsDo: [:c| c vertical fitContent].
"labelsYContainer constraintsDo: [:c| c grid vertical alignBottom. ]."
ticksYContainer := LarContainer new  asElementVertical.
ticksYContainer layout cellSpacing: 0.
"graphElement := LarContainer new  asElement."
"graphElement constraintsDo: [:c| c grid vertical alignBottom. ]."

graphElement := BlElement new
border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);
			
			background: (BlBackground paint: Color white).


axisXContainer := LarContainer new asElement. 
container := LarContainer new asElementVertical.
containerTickAndLabel :=LarContainer new  asElement.
containerTickAndLabel constraintsDo: [:c| c vertical fitContent].
containerTickAndLabel constraintsDo: [:c| c grid vertical alignBottom. ].
containerTickAndLabel layout cellSpacing: 0.
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
graphElement constraintsDo: [:c| c grid vertical alignBottom. ].
container layout columnCount: 2.
container layout rowCount: 4.
empty := BlElement new. 
empty_too := BlElement new. 
empty_other := BlElement new. 
labelsContainer:= (LarContainer new) asElement.
labelsContainer constraintsDo: [:c| c horizontal exact: 600].
labelsContainer layout cellSpacing: 0.

"containerTickAndLabelX :=LarContainer new  asElement.
containerTickAndLabelX constraintsDo: [:c| c vertical fitContent].
containerTickAndLabelX constraintsDo: [:c| c grid vertical alignBottom. ].
containerTickAndLabelX layout cellSpacing: 0.
containerTickAndLabelX addChild: labelsContainer. 
containerTickAndLabelX addChild: ticksYContainer. 
"


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
(plotter borders )
ifTrue: [self setBlackBorders].
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
(plotter dict at: 'data' at: 'values') isEmpty 
ifFalse:[self addPoints: plotter addPoints].

self addAxisLabelX: (plotter addAxisLabel) first.
self addAxisLabelY: (plotter addAxisLabel) last.
(plotter dict at: 'data' at: 'values') isEmpty 
ifFalse:[self addTicksLabelX: plotter addTicksLabelX.
		self addTicksLabelY: plotter addTicksLabelY].
self addTitle: plotter title.
(plotter dict at: 'data' at: 'values') isEmpty 
ifTrue:[(plotter dict at: 'data') at: 'tick' ifPresent: [self addTicksY: plotter addTicks]]
ifFalse:[self addTicksY: plotter addTicks]
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> setBlackBorders [
container setBlackBorders. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatterElement >> smallAdding: height [
	| spareLabelYContainer |
	
		spareLabelYContainer := LarContainer new initialize
					asElementVertical
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: height / 2 ].
			spareLabelYContainer layout cellSpacing: 0.
			labelsYContainer addChild: spareLabelYContainer 
]
