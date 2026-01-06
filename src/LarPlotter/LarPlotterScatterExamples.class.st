Class {
	#name : 'LarPlotterScatterExamples',
	#superclass : 'Object',
	#category : 'LarPlotter-Examples',
	#package : 'LarPlotter',
	#tag : 'Examples'
}

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> Example1 [
<gtExample>
	| plotter dict |
	dict := GtScatterChartSpecExamples new
			gtBookPagesByKindBarChart asJsonString.
	plotter := LarPlotterScatter new.
	plotter spec: dict.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> Example2 [
<gtExample>
	| plotter dict |
	dict := GtScatterChartSpecExamples new
			gtPagesFromDatabase asJsonString.
	plotter := LarPlotterScatter new.
	plotter spec: dict.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> Example3 [
<gtExample>
| plotter dict |
	dict := GtScatterChartSpecExamples new
			CorrelatingMethodSizeSndCommits asJsonString.
	plotter := LarPlotterScatter new.
	plotter spec: dict.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> Example4 [
<gtExample>
| plotter dict |
	dict := GtScatterChartSpecExamples new
			CorrelatingMethodSizeSndCommitsObject asJsonString.
	plotter := LarPlotterScatter new.
	plotter spec: dict.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> newGraph [
<gtExample>

^ LarPlotterScatter new 
	
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaExample1 [
<gtExample>
	| spec plotter |
	spec := self vegaSpec1.
	plotter := LarPlotterScatter  new.
	plotter spec: spec.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaExample2 [
<gtExample>
	| spec plotter |
	spec := self vegaSpec2.
	plotter := LarPlotterScatter  new.
	plotter spec: spec.
^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaExample3 [
<gtExample>
	| spec plotter |
	spec := self vegaSpec3.
	plotter := LarPlotterScatter  new.
	plotter spec: spec.
	^ plotter initializeBuild
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaSpec1 [
	| jsonString |
	"https://vega.github.io/vega-lite/examples/point_2d.html"
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A scatterplot showing horsepower and miles per gallons for various cars.",
  "data": {"url": "data/cars.json"},
  "mark": "point",
  "encoding": {
    "x": {"field": "Horsepower", "type": "quantitative"},
    "y": {"field": "Miles_per_Gallon", "type": "quantitative"}
  }
}'.
	^ jsonString
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaSpec2 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A scatterplot showing body mass and flipper lengths of penguins.",
  "data": {
    "url": "data/penguins.json"
  },
  "mark": "point",
  "encoding": {
    "x": {
      "field": "Flipper Length (mm)",
      "type": "quantitative",
      "scale": {"zero": false}
    },
    "y": {
      "field": "Body Mass (g)",
      "type": "quantitative",
      "scale": {"zero": false}
    },
    "color": {"field": "Species", "type": "nominal"},
    "shape": {"field": "Species", "type": "nominal"}
  }
}'.
^jsonString
]

{ #category : 'as yet unclassified' }
LarPlotterScatterExamples >> vegaSpec3 [
	| jsonString |
	jsonString := '{
  "$schema": "https://vega.github.io/schema/vega-lite/v6.json",
  "description": "A bubbleplot showing horsepower on x, miles per gallons on y, and binned acceleration on size.",
  "data": {"url": "data/cars.json"},
  "mark": "point",
  "encoding": {
    "x": {"field": "Horsepower", "type": "quantitative"},
    "y": {"field": "Miles_per_Gallon", "type": "quantitative"},
    "size": {"field": "Acceleration", "type": "quantitative"}
  }
}'.
	^ jsonString
]
