package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Reiziger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Dao voor reizigers
 *
 * @author HBO-ICT
 */
public class MySQLReizigers extends MySQL<Reiziger> {

    private final List<Reiziger> reizigers;


    /**
     * Constructor
     */
    public MySQLReizigers() {
        // init arraylist
        reizigers = new ArrayList<>();

        // Laad bij startup
        load();
    }

    /**
     * Doe dit bij het maken van dit object
     */
    private void load() {

        // Voer hier je SQL code in
        String sql = """
                SELECT reiziger.code as reizigerCode,
                reiziger.voornaam,
                reiziger.achternaam,
                reiziger.adres,
                reiziger.postcode,
                reiziger.plaats,
                reiziger.land,
                CONCAT(r.voornaam, ' ', r.achternaam) as hoofdreiziger
                FROM reiziger
                    LEFT JOIN reiziger AS r on reiziger.hoofd_reiziger = r.code;
                """;

        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                Reiziger reiziger = new Reiziger();
                reiziger.setCode(rs.getString("reizigerCode"));
                reiziger.setVoornaam(rs.getString("voornaam"));
                reiziger.setAchternaam(rs.getString("achternaam"));
                reiziger.setAdres(rs.getString("adres"));
                reiziger.setPostcode(rs.getString("postcode"));
                reiziger.setPlaats(rs.getString("plaats"));
                reiziger.setLand(rs.getString("land"));
                reiziger.setHoofdreiziger(rs.getString("hoofdreiziger"));
                reizigers.add(reiziger);
//                System.out.println(reiziger.toJson());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Geen alle reizigers in de arraylist terug
     *
     * @return arraylist met reizigers
     */
    @Override
    public List<Reiziger> getAll() {
        return reizigers;
    }

    /**
     * Haal 1 reiziger op
     *
     * @return reiziger object
     */
    @Override
    public Reiziger get() {
        return null;
    }

    /**
     * Voeg reiziger toe
     *
     * @param reiziger reiziger
     */
    @Override
    public void add(Reiziger reiziger) {

    }

    /**
     * Update reiziger
     *
     * @param reiziger reiziger
     */
    @Override
    public void update(Reiziger reiziger) {

    }

    /**
     * Verwijder reiziger
     *
     * @param object reiziger
     */
    @Override
    public void remove(Reiziger object) {

    }

    /**
     * Refresh het scherm
     */
    public void reload() {
        reizigers.clear();
        load();
    }

}
