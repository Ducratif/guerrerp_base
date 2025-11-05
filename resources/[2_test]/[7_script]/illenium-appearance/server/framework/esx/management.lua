--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Framework.ESX() then return end

if Config.BossManagedOutfits then
    function isBoss(grades, grade)
        local highestGrade = grades[1].grade
        for i = 2, #grades do
            if grades[i].grade > highestGrade then
                highestGrade = grades[i].grade
            end
        end
        return highestGrade == grade
    end
    lib.addCommand("bossmanagedoutfits", { help = _L("commands.bossmanagedoutfits.title"), }, function(source)
        local job = Framework.GetJob(source)
        local grades = Database.JobGrades.GetByJobName(job.name)
        if not grades then
            return
        end

        if not isBoss(grades, job.grade.level) then
            return
        end

        TriggerClientEvent("illenium-appearance:client:OutfitManagementMenu", source, {
            type = "Job"
        })
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
