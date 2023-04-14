# Supported syntax

## Page summary (`summary`)

### Tags (`summary.<tag>`)

#### Singular value tags (`summary.<singular-tag>`)

> :information_source: Required: dependent.

The following singular value tags are supported:

- `optional`: whether file can be absent or not  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **example**:

  ```yaml
  examples:
    The C shell:
      name: csh
      optional: true
  ```

- `is`: where to import details about file from  
  **type**: *object*  
  **required**: *false*  
  **default**: *false*  
  **example**:

  ```yaml
  examples:
    The C shell:
      name: csh
      optional: true
      is: url-to-yaml-file-describing-file
  ```

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
