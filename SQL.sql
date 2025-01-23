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

--MISSING PROPERTY ADDRESS
SELECT 
	UniqueID,
	COALESCE(PropertyAddress,'Unknown') AS PropertyAdress

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


--consistency in SoldAsVacant by replacing 'N' and 'Y' with 'No' and 'Yes'.
	--checking for null values
SELECT 
	SoldAsVacant 
FROM
	NashvilleHousing
WHERE
	SoldAsVacant is null

	--replacing N,Y 
SELECT	
	SoldAsVacant
FROM
	NashvilleHousing
WHERE
	SoldAsVacant IN ('N','Y')

UPDATE 
	NashvilleHousing
SET
	SoldAsVacant=CASE
	WHEN SoldAsVacant IN ('N','n') THEN 'No'
	WHEN SoldAsVacant IN ('Y','y') THEN 'Yes'
	ELSE SoldAsVacant
	END;

--removing duplicates

SELECT UniqueID,COUNT( *) AS CountID
FROM
	NashvilleHousing
GROUP BY 
	UniqueID
HAVING COUNT( *)>1
	
	--Deleting Duplicates
WITH CTE_Dup AS(
SELECT 
	*, 
	ROW_NUMBER() OVER(PARTITION BY UniqueID ORDER BY (SELECT NULL)) AS RowNum
FROM 
	NashvilleHousing
	)
DELETE NashvilleHousing
WHERE UniqueID IN(
	SELECT 
		UniqueID
	FROM
		CTE_Dup
	WHERE 
		RowNum>1
		)

--Property Age
	--	Create New Column
ALTER TABLE NashvilleHousing
ADD PropertyAge INT
	--PropertyAge
WITH CTE_propAge AS(
SELECT 
	UniqueID,YearBuilt,(YEAR(GETDATE())-YearBuilt) As PropAge
FROM
	NashvilleHousing
	)
UPDATE Nh
SET Nh.PropertyAge=CTE.PropAge
FROM NashvilleHousing Nh
JOIN CTE_propAge CTE
ON Nh.UniqueID=CTE.UniqueID


