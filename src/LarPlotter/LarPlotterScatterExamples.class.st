Class {
	#name : #LarPlotterScatterExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> newGraph [
<gtExample>

^ LarPlotterScatter new 
	
]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> vegaExample1 [
<gtExample>
	| spec plotter |
	spec := self vegaSpec1.
	plotter := LarPlotterScatter  new.
	plotter spec: spec.
	^ plotter
]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> vegaExample2 [
<gtExample>
	| spec plotter |
	spec := self vegaSpec2.
	plotter := LarPlotterScatter  new.
	plotter spec: spec.
	^ plotter
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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
