# Configure-New-Model
A script to update various view settings to my preferences.

See also: [How to use Femap Scripts](https://github.com/aaronjasso/How_to_use_Femap_Scripts) and [The List of my Femap Scripts](https://github.com/aaronjasso/My-Femap-Scripts)

---

When starting a new model (or opening someone else's model), I used to have to change a bunch of the default view settings. This script does all that for me. These are the settings I like, you'll probably want to edit it to make it useful for you.

**This script is license-free** and released into the public domain.

---

## What it does
The script currently changes the following view settings.

### 1. Labels, Entities, and Color

#### Label Parameters
* View, Erase Back
* Text Depth Offset: 5

#### Element
* Color Mode: Property Colors

#### Element - Material Direction
* Use View Color
* set View Color to Black

#### Load - Force and Bearing
* Display nodal forces as Global Components
>Note: As of Femap 12.0.1a, this setting doesn't appear to persist unless there are existing nodal forces in the model. I haven't yet checked it with Femap 2019

#### Load - Temperature
* Don't show labels on thermal loads

### 2. Tools and View Style

#### Free Edge and Face
* Draw model when displaying free edge

#### View Axis
* Move axis to the bottom left edge

#### Origin
* Don't display the origin marker

#### Symbols
* Symbol size: 5

### 3. PostProcessing

#### Deformed Style
* Set deformed model scale to 5% of model

#### Animated Style
* Sin, full abs
* Number of animation frames: 10
* Frame delay: 81

#### Contour/Criteria Legend
* Use view color for labels

#### Criteria - Elements that Pass/Fail
* Don't show labels
* Draw failed elements
* Label failing elements

### 4. Other
* Rename first view to "Working"
