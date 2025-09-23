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
	^jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> bookPagesByKind [
<gtExample>
	| dict plotter |
	dict := GtBarChartSpecExamples new gtBookPagesByKindBarChart asJsonString.	"dict := STONJSON fromString: dict. "
	plotter := LarPlotterBar new.
	^ plotter spec: dict
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
LarPlotterBarExamples >> colorSpec [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A bar chart that directly encodes color names in the data.",
  "data": {
    "values": [
      {
        "color": "red",
        "b": 28
      },
      {
        "color": "green",
        "b": 55
      },
      {
        "color": "blue",
        "b": 43
      }
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {
      "field": "color",
      "type": "nominal"
    },
    "y": {
      "field": "b",
      "type": "quantitative"
    },
    "color": {
      "field": "color",
      "type": "nominal",
      "scale": null
    }
  }
}'.
^jsonString
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
	^ jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> testSpec [
	<gtExample>
	|  |
	^self newGraph spec: self barChartSpec.
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> topicMapChart [
	<gtExample>
	| plotter dict |
	dict := self topicMapData .
	plotter:= LarPlotterBar new.
	plotter spec: dict.
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

	(dict
		at: 'data')
		at: 'bars'
		put: json.
	^ dict
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> url [
^'https://vega.github.io/vega-lite/examples/'
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaColorChart [
<gtExample>
	| spec plotter |
	spec := self colorSpec.
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^ plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaExample1 [
	<gtExample>
	|   plotter spec |
	spec := self barChartSpec.
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^ plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaExample2 [
	<gtExample>
	|  plotter spec |
	
	spec := self vegaSpec2.	
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^ plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaSpec2 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "data": {"url": "data/barley.json"},
  "mark": "bar",
  "encoding": {
    "x": {"aggregate": "sum", "field": "yield"},
    "y": {"field": "variety"},
    "color": {"field": "site"}
  }
}'.
^ jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaSpec3 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "data": {"url": "data/seattle-weather.csv"},
  "mark": {"type": "bar", "cornerRadiusTopLeft": 3, "cornerRadiusTopRight": 3},
  "encoding": {
    "x": {"timeUnit": "month", "field": "date", "type": "ordinal"},
    "y": {"aggregate": "count"},
    "color": {"field": "weather"}
  }
}'.
^STONJSON fromString: jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaSpecData2 [
	<gtExample>
	| urlNew segments fileName file jsonData transformation spec json variety|
	spec := self vegaSpec2.
	urlNew := (spec at: 'data' at: 'url') addedToZnUrl: self url asZnUrl.
	segments := ((self vegaSpec2 at: 'data') at: 'url') findTokens: '/'.
	fileName := segments last.
	(FileLocator downloads / fileName) ensureDelete.
	ZnClient new
		url: urlNew;
		signalProgress: true;
		downloadTo: FileLocator downloads.
	file := (FileLocator downloads / fileName) contents.
	jsonData := STONJSON fromString: file.

	transformation := OrderedCollection new.
	jsonData do: [ :d | transformation add: (d at: 'variety') ].
	transformation := transformation removeDuplicates.


	
	json := transformation
		 collect: [ :aField | 
				variety := OrderedCollection new. 
				jsonData do: [ :aStyle | (aStyle includes: aField )
				ifTrue: [variety add: aStyle]].
				 {'name' -> 'A'.
					'object' -> aField.
					'element'
						-> (variety collect: [ :d | (d at: 'site') -> (d at: 'yield')]) asDictionary} asDictionary ].
					^json asArray
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> vegaSpecData3 [
| urlNew segments fileName file jsonData filter transformation |
	urlNew := ((self vegaSpec3 at: 'data') at: 'url') addedToZnUrl: self url asZnUrl.
	segments := ((self vegaSpec3 at: 'data') at: 'url') findTokens: '/'.
	fileName := segments last.
	(FileLocator downloads / fileName) ensureDelete.
	ZnClient new
		url: urlNew;
		signalProgress: true;
		downloadTo: FileLocator downloads.
	file := (FileLocator downloads / fileName) contents.
	jsonData := (CSV2JSON for: file) jsonObject.
	filter := (((self vegaSpec3 at: 'transform') first at: 'filter') findTokens: '===') last
			copyWithout: $'.
	transformation := OrderedCollection new.
]
