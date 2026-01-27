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
	<text: 'Example of a scatter plot from Vega-Lite. Difference in the spec. what does it depcit explain. Show interaction.'>
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
	<text: 'Example with data from GT. What does it dipict. Show interactions'>
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
	<text: 'A psec with gt data. Have a class to wite these spec. To have interactivity with GT objects added new keys in the spec that do not existe in the vega-Lite spec.'>
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
	<text: 'Picture of hof the classes interact with each other'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'interaction_final.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> extraSlide3: aSlide [
	<gtSlide>
	<text: 'Picture of hof the classes interact with each other'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'pipeline.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> researchQuestion: aSlide [
	<gtSlide>
	<text: 'These where my objectives for my presentation. Difference of gog and layered gog: graphical elements are combined in layers to form a complete visualization. Why GT? Layered grammas is always emedded in an existing language. Helps users to inspect virtually any aspect of a system. In addition, it provides strong
support for customizing visualizations and integrating interaction mechanisms'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Objectives of my thesis');
		paragraphWithFormat: (self
				asText: '
• To develop a comprehensive understanding of layered grammars of graphics.
				
• To design and implement a proof of concept of a layered grammar of graphics in Glamorous Toolkit
based on Vega-Lite.

• To evaluate the use of a layered grammar of graphics in Glamorous Toolkit and to add an interactive
layer to the visual display for the user.
')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	<noTest>
	^ #(titleSlide:), #(visualization1:), #(visualization_vega:), #(visualization_ex:), #(researchQuestion:), #(example_graph:), #(example_over:)," #(example_specex4:)," "#(example_ex4:)," #(example_specexGt:), #(example_exGt:), #(example_scatterEx:), #(example_scatterExGt:)
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> titleSlide: aSlide [
	<gtSlide> 
	<text: 'A title slide with multiple, centered texts.'>
	^ (aSlide titleWithFooters)
		setPriority;
		titleWithFormat: (self asTitle: 'A Layered Grammar of Graphics for Interactive Graphic Displays');
		subtitleWithFormat: (self asSubtitle: 'A Prove of Concept in Glamorous Toolkit');
		newFooterWithFormat: (self asBigText: 'A Master Thesis by') underline;
		newFooterWithFormat: (self asBigText: 'Lou-Anne Robert');
		newFooterWithFormat: (self asBigText: '    ');
		newFooterWithFormat: (self asBigText: 'Supervisors') underline;
		newFooterWithFormat: (self asBigText: 'Timo Kehrer, Oscar Nierstrasz')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization1: aSlide [
	<gtSlide>
	<text: 'Viszualizations are importatnt to get more insight into datasets. Explain the concept of Anscombes Quartett. other dimensions could help'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asTitle: 'Visualizations');
		newTextWithFormat: (self asText: 'Visualizations are importatnt to get more insight into datasets.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'ascomb_zus.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_ex: aSlide [
	<gtSlide>
	<text: 'How to display grphs? To systematically construct visualizations, a grammar of graphics provides a declarative approach for
defining graphs in a uniform, consistent, and reproducible manner. This approach improves transparency
by clearly describing how a visualization is composed. Vega-Lite '>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'A grammar of graphics provides a declarative approach for defining graphs in a uniform, consistent, and reproducible manner.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'vega_screen.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_vega: aSlide [
	<gtSlide>
	<text: 'Since pages can also be differentiated by field would be nicecto see this what pages go under which kind and or field. Some interactivity could be nice.'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are importatnt to get more insight into datasets.');
		element: [ LarPlotterBarExamples new bookPagesByKind].
]
