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
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #Example3)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_graph: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #testSpec)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_over: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterBarExamples >> #testSpecOverwrite)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_scatterEx: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: LarPlotterScatterExamples >> #vegaExample3)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> example_scatterExGt: aSlide [
	<gtSlide>
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
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
	<text: 'A coder on a method'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A coder on an example method';
		element: [ GtPagerSettings usedPager
				createWrappedOn: (GtPharoMethodCoder forMethod: GtBarChartSpecExamples >> #stackedGtBookFieldsByKindBarChartWithChartSendBar)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> researchQuestion: aSlide [
	<gtSlide>
	<text: 'Text with a paragraph'>
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
	^ #(titleSlide:), #(visualization1:), #(visualization_vega:), #(visualization_ex:), #(researchQuestion:), #(example_graph:), #(example_over:), #(example_specex4:), #(example_ex4:), #(example_specexGt:), #(example_exGt:), #(example_scatterEx:), #(example_scatterExGt:)
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
		newFooterWithFormat: (self asBigText: 'Lou-Anne Robert')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization1: aSlide [
	<gtSlide>
	<text: 'Viszualizations are importatnt to get more insight into datasets'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are importatnt to get more insight into datasets.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'ascomb_zus.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_ex: aSlide [
	<gtSlide>
	<text: 'Viszualizations are importatnt to get more insight into datasets'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are importatnt to get more insight into datasets.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'vega_screen.png') ]
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization_vega: aSlide [
	<gtSlide>
	<text: 'Viszualizations are importatnt to get more insight into datasets'>
	^ aSlide textAndElement
		elementWeight: 1;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are importatnt to get more insight into datasets.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'vega_beisp_interact.png') ]
]
