class YAB_CL_AA_ASSET definition
  public
  create public .

public section.

  class-methods SET_CREATED_DETAIL
    exporting
      !CRTD_BY type YAB_AA_CRTD_BY
      !CRTD_DATE type YAB_AA_CRTD_DATE
      !CRTD_TIME type YAB_AA_CRTD_TIME .
protected section.
private section.
ENDCLASS.



CLASS YAB_CL_AA_ASSET IMPLEMENTATION.


  METHOD set_created_detail.

    crtd_by = sy-uname.
    crtd_date = sy-datum.
    crtd_time = sy-uzeit.

  ENDMETHOD.
ENDCLASS.
