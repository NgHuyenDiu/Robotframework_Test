*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/product_selectors.py
*** Keywords ***
sort by position
    select from list by label    ${sort_by}     Position

sort by Name: A to Z
    select from list by label    ${sort_by}     Name: A to Z

sort by Name: Z to A
    select from list by label    ${sort_by}     Name: Z to A

sort by Price: Low to High
    select from list by label    ${sort_by}     Price: Low to High

sort by Price: High to Low
    select from list by label    ${sort_by}     Price: High to Low

sort by Created on
    select from list by label    ${sort_by}     Created on

select 3 product per page
    select from list by value    ${product_per_page}    3

select 6 product per page
    select from list by value    ${product_per_page}    6

select 9 product per page
    select from list by value    ${product_per_page}    9