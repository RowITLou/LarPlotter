Class {
	#name : 'LarPlotterSlideshow',
	#superclass : 'PrioritySlideshow',
	#category : 'LarPlotter-Slideshow',
	#package : 'LarPlotter',
	#tag : 'Slideshow'
}

{ #category : 'as yet unclassified' }
LarPlotterSlideshow class >> show [
	"Implement this here just so we can run it directly from the Coder."
	super show
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> conclusion: aSlide [
	<gtSlide>
	<text: 'I have implemented a grammar of graphics in GT. Sowed that I could do it by implementing examples from vega-Lite and with data from GT. These examples are interactive. Package can be extended by changing the geometric object. Replace the bars or dots by lines for a line graph. all other elements are the same. Had no time to implement the layered finctionality, but the grammar is made for this so if I implement the corresponding plotter this can work. How would this look like? Could add more intercations in the future like zooming. and more specs could be implemented'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Conclusion');
		paragraphWithFormat: (self
				asText: '
• Implemented a proof of concept for an interactive layered Grammar of Graphics in GT.
				
• Easily extensible to support other kinds of charts.

• Could not implement the layered functionality. 

• More interactions, contextual views and specifications could be added.

')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> discussion: aSlide [
	<gtSlide>
	<text: ' '>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Objectives of my thesis');
		paragraphWithFormat: (self
				asText: '
• Can extend the package easily with other charts
				
• To design and implement a proof of concept of a layered grammar of graphics in Glamorous Toolkit
based on Vega-Lite.

• To evaluate the use of a layered grammar of graphics in Glamorous Toolkit and to add an interactive
layer to the visual display for the user.
')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_ex4: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #vegaExample2)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_exGt: aSlide [
	<gtSlide>
	<text: 'graph with data from GT. Here you see pages by kind and by field. When clicking on these you get to the corresponing topic map. Show all interactions'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'An example for a graph with data from GT';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #Example3)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_graph: aSlide [
	<gtSlide>
	<text: 'We see the different keys that are important for the generation of the graph. Give the spec to the Plotter and initialize the build. Graph comes back. When giving the spec it will do some calculations such as how many ticks'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Implementation of a Vega-Lite Example';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #testSpec)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_over: aSlide [
	<gtSlide>
	<text: 'In layered grammar of graphics defaults are set. Can overwrite them such as ticks'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Overwriting defaults in a graph';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #testSpecOverwrite)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_scatterEx: aSlide [
	<gtSlide>
	<text: 'Example of a scatter plot from Vega-Lite. Difference in the spec. What does it depict? Explain. Show interaction.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Example of a scatter plot from Vega-Lite';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterScatterExamples >> #vegaExample3)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_scatterExGt: aSlide [
	<gtSlide>
	<text: 'Example with data from GT. What does it depict? Show interactions'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Example of a scatter plot with data from GT';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterScatterExamples >> #Example2)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_specex4: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #vegaSpec2)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_specexGt: aSlide [
	<gtSlide>
	<text: 'A spec with GT data. Have a class to write these specs. To have interactivity with GT objects added new keys in the spec that do not exist in the Vega-Lite spec.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A spec for a graph generated with GT data';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: GtBarChartSpecExamples >> #fullSpec)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide1: aSlide [
	<gtSlide>

<text: 'A coder on the LarPlotterBarClass'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'The LarPlotterBar class';
		element: [ (GtCoderElement forClass: LarPlotterBar) createInPager maximized ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide2: aSlide [
	<gtSlide>
	<text: 'Sequence diagram of how the classes interact with each other'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'interaction_final.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide3: aSlide [
	<gtSlide>
	<text: 'Picture of how the classes interact with each other'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'pipeline.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide4: aSlide [
	<gtSlide>
<text: 'Picture of a graph  with more defined specs'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'IMDB.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide5: aSlide [
	<gtSlide>
<text: 'Picture of a spec  with more defined specs'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'IMDB_spec.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide6: aSlide [
	<gtSlide>
<text: 'Picture of layered graph'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'vega_layers.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide7: aSlide [
	<gtSlide>
<text: 'Picture of spec for layered graph'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'layered_spec.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> path [
	^ Path * 'RowITLou' / 'LarPlotter' / 'images'
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> researchQuestion: aSlide [
	<gtSlide>
	<text: 'These were my objectives for my presentation. Difference of gog and layered gog: graphical elements are combined in layers to form a complete visualization. Why GT? Layered grammas is always emedded in an existing language. Helps users to inspect virtually any aspect of a system. In addition, it provides strong support for customizing visualizations and integrating interaction mechanisms. Does not have a declarative approach to generate graphics yet. '>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Objectives of my thesis');
		paragraphWithFormat: (self
				asText: '
• To develop a comprehensive understanding of layered grammars of graphics.

• To design and implement a proof of concept of a layered grammar of graphics in Glamorous Toolkit based on Vega-Lite.

• To evaluate the use of a layered grammar of graphics in GT and to add an interactive layer to the display.
')
]

{ #category : 'examples' }
LarPlotterSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	<noTest>
	^ #(titleSlide:), #(visualization1:), #(visualization_vega:), #(visualization_ex:), #(researchQuestion:), #(example_graph:), #(example_over:)," #(example_specex4:)," "#(example_ex4:)," #(example_specexGt:), #(example_exGt:), #(example_scatterEx:), #(example_scatterExGt:), #(conclusion:), #(extraSlide1:), #(extraSlide2:), #(extraSlide3:), #(extraSlide4:), #(extraSlide5:), #(extraSlide6:), #(extraSlide7:)
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> titleSlide: aSlide [
	<gtSlide> 
	<text: 'A title slide with multiple, centered texts.'>
	^ (aSlide titleWithFooters)
		setPriority;
		titleWithFormat: (self asTitle: 'A Layered Grammar of Graphics ');
		subtitleWithFormat: (self asTitle: 'for Interactive Graphic Displays');
		newFooterWithFormat: (self asSubtitle: 'A Proof of Concept in Glamorous Toolkit');
		newFooterWithFormat: (self asBigText: 'A Master Thesis by') underline;
		newFooterWithFormat: (self asBigText: 'Lou-Anne Robert');
		newFooterWithFormat: (self asBigText: '    ');
		newFooterWithFormat: (self asBigText: 'Supervisors') underline;
		newFooterWithFormat: (self asBigText: 'Timo Kehrer, Oscar Nierstrasz')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization1: aSlide [
	<gtSlide>
	<text: 'Viszualizations are important to get more insight into datasets.
Explain the concept of Anscombes Quartet. Other dimensions could help'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		newTextWithFormat: (self asText: 'Visualizations are important to get more insight into datasets.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'ascomb_zus.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_ex: aSlide [
	<gtSlide>
	<text: 'How to display graphs? To systematically construct visualizations, a grammar of graphics provides a declarative approach for defining graphs in a uniform, consistent, and reproducible manner. This approach improves transparency by clearly describing how a visualization is composed. Vega-Lite '>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'A grammar of graphics provides a declarative approach for defining graphs in a uniform, consistent, and reproducible manner.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self path / 'vega_screen.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_vega: aSlide [
	<gtSlide>
	<text: 'Since pages can also be differentiated by field, it would be nice to see this.
What pages go under which kind and or field? Some interactivity could be nice.'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are important to get more insight into datasets.');
		element: [ LarPlotterBarExamples new bookPagesByKind].
]
