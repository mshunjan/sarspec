process RUN_ALCOV {
    tag "$run_alcov"
    label 'process_low'

    container "TODO"

    input:
    tuple val(meta), path(samples)

    output:
    tuple val(meta), path("alcov")  , emit: results
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
