SELECT top 20 

ID,
PI_PI,
HOUSING_HUSBANDRY_SS,
HOUSEING_HUSBANDRY_OTHER,
EXCEPTIONS_PROCEDURES_SM,
OTHER_PROCEDURE_TSL,
EXECEPTIONS_NOT_APPLY_SM,
EXCEPTIONS_RTE


FROM   gen_osu_iacuc 




SELECT study_rb_iacuc.iacuc_number                   AS [IACUC Study Number],
       study.study_status                            AS [Study Status],
       gen_osu_iacuc.pi_pi                           AS [PI Name],


gen_osu_iacuc.HOUSING_HUSBANDRY_SS,
gen_osu_iacuc.HOUSEING_HUSBANDRY_OTHER,
gen_osu_iacuc.EXCEPTIONS_PROCEDURES_SM,
gen_osu_iacuc.OTHER_PROCEDURE_TSL,
gen_osu_iacuc.EXECEPTIONS_NOT_APPLY_SM,
gen_osu_iacuc.EXCEPTIONS_RTE

      
FROM   study_rb_iacuc
       INNER JOIN study
               ON study_rb_iacuc.system_study_id = study.system_study_id
       INNER JOIN gen_osu_iacuc
               ON study.study_app_data_id = gen_osu_iacuc.id
WHERE  ( study.study_status = N'IACUC - Approved' )
       -- AND ( gen_osu_iacuc.allowing_animals_experience_syn = N'Yes' )
ORDER  BY [iacuc study number] 


SELECT        study_rb_iacuc.IACUC_NUMBER AS [IACUC Study Number], study.STUDY_STATUS AS [Study Status], gen_osu_iacuc.PI_pi AS [PI Name], 
                         gen_osu_iacuc.HOUSING_HUSBANDRY_SS AS [Approved Housing and Husbandry Standards], gen_osu_iacuc.HOUSEING_HUSBANDRY_OTHER AS [Specify Other Housing Husbandry], 
                         gen_osu_iacuc.EXCEPTIONS_PROCEDURES_SM AS [Expections to Approved Procedures], gen_osu_iacuc.OTHER_PROCEDURE_TSL AS [Specify Other Exceptions to Procedures], 
                         gen_osu_iacuc.EXECEPTIONS_NOT_APPLY_SM AS [Exceptions NA], gen_osu_iacuc.EXCEPTIONS_RTE AS [Rationale and Description to Exceptions]
FROM            study_rb_iacuc INNER JOIN
                         study ON study_rb_iacuc.SYSTEM_STUDY_ID = study.SYSTEM_STUDY_ID INNER JOIN
                         gen_osu_iacuc ON study.STUDY_APP_DATA_ID = gen_osu_iacuc.ID
WHERE        (study.STUDY_STATUS = N'IACUC - Approved')
ORDER BY [iacuc study number]