
-- Gauss's algorithm to calculate the date of Easter
function calculateEasterDate(year)
    -- Golden number calculation
    local golden = (year % 19) + 1

    -- Century
    local century = math.floor(year / 100) + 1

    -- Correction factor for moon's orbit
    local moon_correction = math.floor((3 * century) / 4) - 12

    -- Correction factor for year
    local year_correction = (8 * century + 5) / 25 - 5

    -- Julian leap year correction
    local leap_correction = math.floor((5 * year) / 4) - moon_correction - 10

    -- Find Sunday after the full moon
    local sunday = (11 * golden + 20 + leap_correction - year_correction) % 30

    -- Adjust for leap year
    if (sunday == 25 and golden > 11) or sunday == 24 then
        sunday = sunday + 1
    end

    -- Find the full moon
    local full_moon = 44 - sunday
    if full_moon < 21 then
        full_moon = full_moon + 30
    end

    -- Convert to Gregorian calendar date
    local month = math.floor(full_moon / 32) + 3
    local day = (full_moon % 32) + 1

    -- Adjust for April
    if month == 4 then
        month = 3
    end

    -- Return the date of Easter
    return year, month, day
end


-- Example usage:
local year = 2024 -- Change this to the desired year
local easter_year, easter_month, easter_day = calculateEasterDate(year)
print("Easter in " .. year .. " falls on " .. easter_year .. "/" .. easter_month .. "/" .. easter_day)

