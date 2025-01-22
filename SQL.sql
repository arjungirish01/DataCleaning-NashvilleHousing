--Formating SaleDate

WITH CTE_SaleDate AS(

	SELECT UniqueID,CAST(SaleDate AS date) AS SaleDateCorrected FROM NashvilleHousing
)
UPDATE NH
SET 
	NH.SaleDate=CTS.SaleDateCorrected
FROM 
	NashvilleHousing NH
JOIN 
	CTE_SaleDate CTS
ON 
	NH.UniqueID=CTS.UniqueID

SELECT * FROM NashvilleHousing

--IN CASE DIRECT SaleDate UPDATE IS NOT WORKING

ALTER TABLE NashvilleHousing
ADD SaleDateCorrected date

UPDATE 
	NashvilleHousing
SET 
	SaleDateCorrected=SaleDate

SELECT * FROM NashvilleHousing

ALTER TABLE 
	NashvilleHousing
DROP COLUMN 
	SaleDate

--FILLING MISSING PROPERTY ADDRESS

SELECT * 
FROM 
	NashvilleHousing NH1
JOIN 
	NashvilleHousing NH2
ON 
	NH1.ParcelID=NH2.ParcelID
WHERE
	NH2.PropertyAddress is null 
	and NH1.UniqueID <> NH2.UniqueID
ORDER BY 
	NH1.ParcelID DESC

WITH CTE_PADD AS (
    SELECT 
        NH1.ParcelID,
        NH1.PropertyAddress,
        NH1.UniqueID
    FROM 
        NashvilleHousing NH1
    JOIN 
        NashvilleHousing NH2
    ON 
        NH1.ParcelID = NH2.ParcelID
    WHERE 
        NH2.PropertyAddress IS NULL 
        AND NH1.UniqueID <> NH2.UniqueID
)
UPDATE NH
SET 
    NH.PropertyAddress = CTE.PropertyAddress
FROM 
    NashvilleHousing NH
JOIN 
    CTE_PADD CTE
ON 
    NH.ParcelID = CTE.ParcelID
WHERE 
    NH.PropertyAddress IS NULL 
    AND NH.UniqueID <> CTE.UniqueID;

SELECT *
FROM
	NashvilleHousing
WHERE
	PropertyAddress is null
