# Supported syntax

## Page summary (`summary`)

### Tags (`summary.<tag>`)

#### List like tags (`summary.<array-tag>`)

The following list like tags are supported:

- `compatible`: structure compatible directories  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  
  **note**: Directory `<first-directory>` considered structure compatible with
  directory `<second-directory>` when `<first-directory>` support all
  subdirectories and files that `<second-directory>` does. It doesn't matter
  whether this happens by default or not. Deprecated subdirectories and files
  don't count while comparing structure compatibility.
