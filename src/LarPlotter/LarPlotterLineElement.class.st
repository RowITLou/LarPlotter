Class {
	#name : #LarPlotterLineElement,
	#superclass : #BlElement,
	#instVars : [
		'labelsYContainer',
		'ticksYContainer',
		'graphElement',
		'container',
		'containerTickAndLabel',
		'labelsContainer',
		'labelAxisX',
		'labelAxisY',
		'title'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addAxisLabel: elementX with: elementY [
	labelAxisX := elementX.
	labelAxisY := elementY.
	labelAxisY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
	labelAxisY forceLayout.
	containerTickAndLabel addChildFirst: labelAxisY. 
	containerTickAndLabel forceLayout. 
    container addChild: labelAxisX.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addLines: valuesSize with: n with: element [
| line |
line:= element.

graphElement addChild: line. 
graphElement forceLayout.

^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addTicksLabelX: elementX with: amountTickX with: n [

| tickXLabel tickXcontainer |
	"1 to: (amountTickX - 1) do: [: n| "
tickXLabel := elementX.
 tickXcontainer:= self createContainer.

 tickXcontainer constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal exact:65].
 tickXcontainer addChild: tickXLabel.
labelsContainer addChild: tickXcontainer.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addTicksLabelY: elementY with: amountTickY with: n [
| tickYLabel tickYcontainer |
tickYLabel := elementY. 
tickYcontainer := (LarContainer new initialize) asElementVertical.
tickYcontainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

	tickYcontainer addChild: tickYLabel.
 labelsYContainer addChild: tickYcontainer.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addTicksY: element with: n [
| tickY tickYContainer |
tickY := element.
tickYContainer := (LarContainer new initialize) asElementVertical.
tickYContainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

tickYContainer addChild: tickY.
ticksYContainer addChild: tickYContainer.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> addTitle: text with: element [
| titel  |
	titel:= element.
	self title: text. 
	
	container addChild: titel at: 5.
	
	
	^self
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> create [
| empty empty_too  scroll empty_other grid |

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

labelsContainer:= (LarContainer new ) asElement.
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
LarPlotterLineElement >> createContainer [
| containerC |
containerC := (LarContainer new asElement).
containerC border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
					
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> graphElement [
^graphElement
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> title [
^title
]

{ #category : #'as yet unclassified' }
LarPlotterLineElement >> title: text [
title:= text
]
