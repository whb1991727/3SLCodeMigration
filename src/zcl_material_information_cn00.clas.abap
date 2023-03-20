CLASS zcl_material_information_cn00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-Product
      RETURNING
        VALUE(material_art) TYPE i_product-ProductType.
ENDCLASS.



CLASS zcl_material_information_cn00 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.

    production_date = sy-datum.


* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 03/20/2023 14:30:54 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

SELECT SINGLE FROM i_product fields producttype WHERE product = @MATNR INTO CORRESPONDING FIELDS OF @MATERIAL .

* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 03/20/2023 14:30:54 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    MOVE material-mtart TO material_art.

MATERIAL_ART = MATERIAL-producttype.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_cn00.
    material_info = NEW zcl_material_information_cn00(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

