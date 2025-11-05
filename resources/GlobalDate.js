// ==========================================================
//   GuerreRP - Base publique ESX Legacy
//   Développé et maintenu par : Ducratif
//
//   Discord support : https://discord.gg/kpD8pQBBWm
//   Documentation :  https://github.com/Ducratif/guerrerp
//
//   Merci de conserver ces crédits si vous utilisez,
//   modifiez ou redistribuez cette configuration.
// ==========================================================


(function() {
    const originalDate = Date;

    function CustomDate(...args) {
        if (args.length === 0) {
            return new originalDate(1986, 0, 1); // January 1, 1986 -- Change the 1986 to the year you want
        }

        // If year is provided, use it; otherwise, default to 1986 -- Change 1986 to the year you want
        if (args[0] instanceof Date) {
            return new originalDate(1986, args[0].getMonth(), args[0].getDate(), args[0].getHours(), args[0].getMinutes(), args[0].getSeconds(), args[0].getMilliseconds());
        }
        
        if (args[0] instanceof Array) {
            args[0][0] = 2185; // Ensure year is 1986 -- Change the 1986 to the year you want
        }

        return new originalDate(...args);
    }

    CustomDate.prototype = originalDate.prototype;

    window.Date = CustomDate;
})();

// ==========================================================
//   GuerreRP - Base publique ESX Legacy
//   Développé et maintenu par : Ducratif
//
//   Discord support : https://discord.gg/kpD8pQBBWm
//   Documentation :  https://github.com/Ducratif/guerrerp
//
//   Merci de conserver ces crédits si vous utilisez,
//   modifiez ou redistribuez cette configuration.
// ==========================================================
