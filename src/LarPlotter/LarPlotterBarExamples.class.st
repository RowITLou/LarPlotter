"
Here are some examples what you could do with the plotter
"
Class {
	#name : 'LarPlotterBarExamples',
	#superclass : 'Object',
	#category : 'LarPlotter-Examples',
	#package : 'LarPlotter',
	#tag : 'Examples'
}

{ #category : 'examples' }
LarPlotterBarExamples >> Example1 [
	<gtExample>
	^ self stackedGtBookFieldsByKindBarChart
]

{ #category : 'examples' }
LarPlotterBarExamples >> Example2 [
<gtExample>
	| plotter dict |
	dict := GtBarChartSpecExamples new
			stackedGtBookFieldsByKindBarChartWithChartSend asJsonString.
	plotter := LarPlotterBar new.
	plotter spec: dict.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> Example3 [
<gtExample>
	| plotter dict |
	dict := GtBarChartSpecExamples new fullSpec asJsonString.
	plotter := LarPlotterBar new.
	plotter spec: dict.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> barChartSpec [
	<gtExample>
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple bar chart with embedded data.",
  "title": "A new title",
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

{ #category : 'examples' }
LarPlotterBarExamples >> bookPagesByKind [
<gtExample>
	| dict plotter |
	dict := GtBarChartSpecExamples new gtBookPagesByKindBarChart asJsonString.	"dict := STONJSON fromString: dict. "
	plotter := LarPlotterBar new.
	plotter spec: dict.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> bookPagesByKindEx [
<gtExample>
	| dict plotter |
	dict := GtBarChartSpecExamples new gtBookPagesByKindBarChartExpand asJsonString.	"dict := STONJSON fromString: dict. "
	plotter := LarPlotterBar new.
	plotter spec: dict.
	^plotter initializeBuild
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> labels [
^ #(#A #B  #C #D #E #F #G #H #I #J)
]

{ #category : 'examples' }
LarPlotterBarExamples >> newGraph [
	<gtExample>
	| plotter |
	 plotter := LarPlotterBar new.
	  plotter setData: '[{"a": "A", "b": 28}, {"a": "B", "b": 55}, {"a": "C", "b": 43},
      {"a": "D", "b": 91}, {"a": "E", "b": 81}, {"a": "F", "b": 53},
      {"a": "G", "b": 19}, {"a": "H", "b": 87}, {"a": "I", "b": 52}]'.
	 plotter addTitle: 'This is a title'.
	 plotter addAxisLabel: 'a' with: 'b'. 
	 plotter setAmountTicks: 5.
	 ^ plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> setTicksAmountEx4 [
<gtExample>
	<gtExample>
	|  plotter spec |
	
	spec := self vegaSpec4.	
	plotter := LarPlotterBar new.
	plotter spec: spec.
plotter setAmountTicks: 7.
^plotter initializeBuild
]

{ #category : 'as yet unclassified' }
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

{ #category : 'examples' }
LarPlotterBarExamples >> stackedGtBookFieldsByKindBarChart [
	<gtExample>
	| plotter dict |
	dict := GtBarChartSpecExamples new stackedGtBookFieldsByKindBarChart
			asJsonString.
	plotter := LarPlotterBar new.
	plotter spec: dict.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> testSpec [
	<gtExample>

		| spec plotter |
	spec := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple bar chart with embedded data.",
  "title": "A new title",
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
	
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^ plotter initializeBuild
	
]

{ #category : 'examples' }
LarPlotterBarExamples >> testSpecOverwrite [
	<gtExample>

		| spec plotter |
	spec := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple bar chart with embedded data.",
  "title": "A new title",
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
	
	plotter := LarPlotterBar new.
	plotter spec: spec.
	plotter setAmountTicks: 7.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> url [
^'https://vega.github.io/vega-lite/examples/'
]

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaColorChart [
<gtExample>
	| spec plotter |
	spec := self colorSpec.
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^ plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaExample1 [
	<gtExample>
	"https://vega.github.io/vega-lite/examples/bar.html"
	|   plotter spec |
	spec := self barChartSpec.
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaExample2 [
"https://vega.github.io/vega-lite/examples/stacked_bar_h.html"
	<gtExample>
	|  plotter spec |
		spec := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "data": {"url": "data/barley.json"},
  "mark": "bar",
  "encoding": {
    "x": {"aggregate": "sum", "field": "yield"},
    "y": {"field": "variety"},
    "color": {"field": "site"}
  }
}'.

	plotter := LarPlotterBar new.
	plotter spec: spec.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaExample3 [
"https://vega.github.io/vega-lite/examples/bar_aggregate.html"
	<gtExample>
	|  plotter spec |
	
	spec := self vegaSpec3.	
	plotter := LarPlotterBar new.
	plotter spec: spec.
  ^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaExample4 [
"https://vega.github.io/vega-lite/examples/bar_size_responsive.html"
	<gtExample>
	|  plotter spec |
	
	spec := self vegaSpec4.	
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaExample5 [
"https://vega.github.io/vega-lite/examples/bar_layered_transparent.html"
<gtExample>
	|  plotter spec |
	
	spec := self vegaSpec5.	
	plotter := LarPlotterBar new.
	plotter spec: spec.
	^plotter initializeBuild
]

{ #category : 'examples' }
LarPlotterBarExamples >> vegaSpec2 [
	<gtExample>
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

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> vegaSpec3 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A bar chart showing the US population distribution of age groups in 2000.",
  "height": {"step": 17},
  "data": { "url": "data/population.json"},
  "transform": [{"filter": "datum.year == 2000"}],
  "mark": "bar",
  "encoding": {
    "y": {"field": "age"},
    "x": {
      "aggregate": "sum", "field": "people",
      "title": "population"
    }
  }
}
'.
^jsonString
]

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> vegaSpec4 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "width": "container",
  "height": 250,
  "data": {"url": "data/cars.json"},
  "mark": "bar",
  "encoding": {
    "x": {"field": "Origin"},
    "y": {"aggregate": "count", "title": "Number of Cars"}
  }
}'.
^jsonString
]

{ #category : 'as yet unclassified' }
LarPlotterBarExamples >> vegaSpec5 [
	| jsonString |
	"smal change in the field of the color. can not handle changes fo the field in the json"
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A bar chart showing the US population distribution of age groups and gender in 2000.",
  "data": { "url": "data/population.json"},
  "transform": [
    {"filter": "datum.year == 2000"},
    {"calculate": "datum.sex == 2 ? ''Female'' : ''Male''", "as": "gender"}
  ],
  "width": {"step": 17},
  "mark": "bar",
  "encoding": {
    "x": {"field": "age", "type": "ordinal"},
    "y": {
      "aggregate": "sum", "field": "people",
      "title": "population",
      "stack": null
    },
    "color": {
      "field": "sex", 
      "scale": {"range": ["#675193", "#ca8861"]}
    },
    "opacity": {"value": 0.7}
  }
}'.
^jsonString
]
