process ALCOVE {
    tag "$alcove"
    label 'process_low'

    conda (params.enable_conda ? "bioconda::bwa-mem2=2.2.1" : null)
    container "TODO"

    input:
    tuple val(meta), path(samples)

    output:
    tuple val(meta), path("alcov"), emit: index
    path "versions.yml"             , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ? : ''
    def VERSION = '0.1.1'
    """
    alcov \\
        find_lineages \\
        $samples \\
    ;\\
    alcov \\
        find_mutants \\
        $samples

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        alcov: ${VERSION} 
    END_VERSIONS
}
