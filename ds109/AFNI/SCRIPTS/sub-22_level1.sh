#!/usr/bin/env tcsh

# created by uber_subject.py: version 0.39 (March 21, 2016)
# creation date: Tue Sep 13 15:59:22 2016

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id sub22                                                  \
        -script proc.sub22 -scr_overwrite                                    \
        -blocks tshift align tlrc volreg blur mask scale regress               \
        -copy_anat /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/ANATOMICAL/anatSS.sub-22.nii                                 \
		-anat_has_skull no					       \
        -align_opts_aea -giant_move -check_flip                                \
        -dsets                                                                 \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/FUNCTIONAL/sub-22_task-theoryofmindwithmanualresponse_run-01_bold.nii.gz     \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/FUNCTIONAL/sub-22_task-theoryofmindwithmanualresponse_run-02_bold.nii.gz     \
        -tlrc_base MNI152_2009_template.nii.gz                                 \
        -tlrc_opts_at -pad_base 60                                             \
        -volreg_warp_dxyz 2                                                    \
        -volreg_align_to third                                                 \
        -volreg_align_e2a                                                      \
        -volreg_tlrc_warp                                                      \
	-tlrc_NL_warp							       \
	-tlrc_NL_warped_dsets						       \
		/home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/ANATOMICAL/anatQQ.sub-22.nii				       \
		/home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/ANATOMICAL/anatQQ.sub-22.aff12.1D			       \
		/home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/PREPROCESSING/ANATOMICAL/anatQQ.sub-22_WARP.nii			       \
        -blur_size 8.0                                                         \
        -regress_stim_times                                                    \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/ONSETS/sub-22_combined_false_belief_story_afni.1d               \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/ONSETS/sub-22_combined_false_belief_question_afni.1d            \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/ONSETS/sub-22_combined_false_photo_story_afni.1d                \
            /home/maullz/NIDM-Ex/BIDS_Data/RESULTS/SOFTWARE_COMPARISON/ds109/AFNI/ONSETS/sub-22_combined_false_photo_question_afni.1d             \
        -regress_stim_labels                                                   \
            false_belief_story false_belief_question false_photo_story         \
            false_photo_question                                               \
        -regress_basis_multi                                                   \
            'SPMG1(10)' 'SPMG1(6)' 'SPMG1(10)' 'SPMG1(6)'                      \
	-regress_3dD_stop						       \
	-regress_reml_exec 						       \
        -regress_opts_3dD                                                      \
            -gltsym 'SYM: false_belief_story -false_photo_story'               \
        -glt_label 1 false_belief_vs_false_photo                               \
        -regress_make_ideal_sum sum_ideal.1D                                   \
        -regress_est_blur_epits                                                \
        -regress_est_blur_errts
        
