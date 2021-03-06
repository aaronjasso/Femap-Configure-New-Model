Sub Main
	'===========================================
	'This script makes some configuration changes for the way I prefer
	'my Femap settings, such as changing the symbol size, turning off
	'origin visibility, positioning the veiw axis, etc.
	'
	'Note: it appears that setting the nodal forces to components
	'(ColorMode(FVI_LOAD_FORCE) = 3) doesn't work unless there are
	'already loads defined in the model. Further investigation needed.
	'
	'Written by AMJ, 8/17/2018
	'
	'v2 Updates (4.29.2020)
	'-Changed Preview color to white
	'-Refactored code to use With methodology for the view object
	'
	'v1 Updates (12/11/2019)
	'Added the following settings:
	'-text label. view legend, and post title text colors to white
	'-background to shaded
	'-shading style to vertical
	'-background shade from color 0 to color 80
	'===========================================
    Dim App As femap.model
    Set App = feFemap()
    Dim rc As Variant


    '===========================================
    'Change settings in the View Options menu
	'===========================================
	'Dim VID As Integer
	Dim myView As femap.View
	Set myView = App.feView

	myView.Get(1)

	With myView
		.ColorMode(FVI_LABEL) = 3			'Label: Veiw, Erase Back
		.color(FVI_LABEL) = 124				'set label text color to white NEW
		.color(FVI_VIEW_LEGEND) = 124	'set view legend text color to white NEW
		.color(FVI_POST_TITLES) = 124		'set post title text color to white NEW
		.RenderPushLabel = 5					'Text Depth Offset = 5
		.ColorMode(FVI_ELEMENT) = 3		'Color elements with property colors
		.ColorMode(FVI_ELEMENT_MATL_DIR) = 1	'Use view color for element material directions
		.color(FVI_ELEMENT_MATL_DIR) =125		'Make material direction arrows black
		.ColorMode(FVI_LOAD_FORCE) = 3	'Display nodal forces as components
		.Label(FVI_LOAD_THERMAL) = 0		'Don't show labels on thermal loads
		.ColorMode(FVI_FREE_EDGE) = 2		'Draw model when displaying free edges
		.AxisLocation(0) = 0						'Move veiw axis to absolute left edge
		.AxisLocation(1) = 100					'Move veiw axis to absolute bottom edge
		.Draw(FVI_ORIGIN) = False			'Don't display the origin dot
		.Label(FVI_SYMBOL) = 5				'Set symbol size to 5
		.color(FVI_PREVIEW) = 149		'Set Preview color to white
		.DeformedRelScale = 5				'set deformed model scale to 5% of model
		.Label(FVI_ANIMATED_STYLE) = 5	'set animation to sine, full abs
		.AnimationFrames = 10				'set number of animation frames to 10
		.AnimationDelay = 81				'set animation frame delay to 81 ms
		.ColorMode(FVI_CONTOUR_LEGEND) = 1	'use view color for the contour legend
		.Label(FVI_CRITERIA_PASS) = 0		'no labels on passing criteria elements
		.Draw(FVI_CRITERIA_FAIL) = True	'draw failed elements
		.Label(FVI_CRITERIA_FAIL) = 1			'display labels on failed elements
		.WindowShadeBack = True			'sets window background to shade NEW
		.WindowShadeBackOpt = 0			'set shade option to vertical NEW
		.WindowBackColor = 0					'first shade color NEW
		.WindowBackColor2 = 80				'second shade color NEW
	End With

	myView.Put(1)


    '===========================================
    'Rename the active view from "Untitled" to "Working"
    '
    'NOTE this could have been done with myView.title, but that
    'method doesn't update the tab title until the view is changed or
    'the model is re-opened, so this method is preferred.
	'===========================================
	rc = App.feWindowTitle(0,"Working")

	'Update the view to the new settings
	App.feViewRegenerate(0)


End Sub
