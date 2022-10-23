//
// Runs Alcov for estimating VOC abundance
//

include { RUN_AlCOV } from '../../modules/local/alcov/main'

workflow ALCOV {
    take:
    samples // file: list of samples*

    main:
    RUN_AlCOV ( samples ) 
 
    emit: 
    results = RUN_AlCOV.out.report
    versions = RUN_AlCOV.out.versions // channel: [ versions.yml ]
}
 
