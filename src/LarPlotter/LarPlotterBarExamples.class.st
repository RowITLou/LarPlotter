"
Here are some examples what you could do with the plotter
"
Class {
	#name : #LarPlotterBarExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addAxisLabel [
<gtExample>
| plotter |
	"plotter:= LarPlotterBar new initialize: 500 with: 500."
	^self addTitel addAxisLabel: 'AxisX' with: 'AxisY'. 
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addBars [
<gtExample>

^self newGraph addBars: self values.

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addTitel [
<gtExample>

^self addBars title: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> barChartSpec [
	<gtExample>
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple bar chart with embedded data.",
  "data": {
    "values": [
      {"a": "A", "b": 28}, {"a": "B", "b": 55}, {"a": "C", "b": 43},
      {"a": "D", "b": 91}, {"a": "E", "b": 81}, {"a": "F", "b": 53},
      {"a": "G", "b": 19}, {"a": "H", "b": 87}, {"a": "I", "b": 52}
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {"field": "a", "type": "nominal", "axis": {"labelAngle": 0}},
    "y": {"field": "b", "type": "quantitative"}
  }
}'.
	^ STONJSON fromString: jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> barChartSpecChange [
	<gtExample>
	| spec values bars |
	spec := self barChartSpec.
	values := spec at: 'data' at: 'values'.
	bars := values
			collect: [ :each | 
				{'name' -> (each at: 'a').
				  'object' -> (each at: 'b').
					'element'
						-> {(each at: 'a') -> ((each at: 'b') asInteger) } asDictionary
								} asDictionary	 ].
								^bars
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeFontTitle [
<gtExample>
| plotter |
	plotter := self addTitel .
	plotter title  setFontSize: 50.
	^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeTitle [
<gtExample>
| plotter |
	plotter := (self changeFontTitle) .
	plotter title setText: 'NewTitle'. 
	^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTickLabels [
	<gtExample>
	| plot |
	plot := self addAxisLabel addTicks.
	^ (plot addTicksLabel: self labels)
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> labels [
^ #(#A #B  #C #D #E #F #G #H #I #J)
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> newGraph [
	<gtExample>
	| plotter |
	 plotter := LarPlotterBar new.
	 ^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> specExample [
	| jsonString  |
	jsonString := '{
"data": {
    
  },
  "encoding": {
    "x": {"field": "a"},
    "y": {"field": "b"}
  }
}'.
	^STONJSON fromString: jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> testSpec [
<gtExample>
^self newGraph specVega: (self barChartSpec).
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> topicMapChart [
	<gtExample>
	| plotter dict |
	dict := self topicMapData .
	plotter:= LarPlotterBar new.
	plotter dict: dict.
	^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> topicMapData [
	<gtExample>
	| topicMap fields json dict |
	dict := self specExample.
	topicMap := LeDatabase gtBook topicMap.
	fields := topicMap databaseNode children nodes.
	json := fields
			collect: [ :aField | 
				{'name' -> 'aName'.
					'object' -> aField.
					'element'
						-> (topicMap kinds
								collect: [ :aStyle | aStyle -> (aField pageGroup select: [ :p | p kind = aStyle ]) size ])
								asDictionary} asDictionary ].

	dict
		at: 'data'
		at: 'bars'
		put: json.
	^ dict
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaExample1 [
<gtExample>
	| json dict plotter |
	json := self barChartSpecChange.
	dict := self specExample.
	
		dict 
		at: 'data'
		at: 'bars'
		put: json.
	plotter := LarPlotterBar new.
	plotter dict: dict.
	^ plotter
]
