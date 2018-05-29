#!/usr/bin/env cwl-runner
# Patterned after https://github.com/IGS/Chiron/blob/master/pipelines/qiime2/diff_abundance.cwl

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

hints:
  DockerRequirement:
    dockerPull: qiime2/core:2018.4

inputs:
  comp_table:
    inputBinding:
      prefix: --i-table
    type: File
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  metadata_column:
    inputBinding:
      prefix: --m-metadata-column
    type: string
  feat_visualization:
    inputBinding:
      prefix: --o-visualization
    type: string
    default: 'ancom.qzv'

outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.feat_visualization)

baseCommand: ["qiime", "composition", "ancom"]
