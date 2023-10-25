package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;
import org.bson.Document;

import java.io.Serializable;

/**
 * Model voor Reiziger
 *
 * @author HBO-ICT
 */
public class Reiziger implements Identifable, Serializable {

    private String code;
    private String voornaam;
    private String achternaam;
    private String adres;
    private String postcode;
    private String plaats;
    private String land;
    private String hoofdreiziger;

    public Reiziger(String code, String voornaam, String achternaam, String adres, String postcode, String plaats, String land, String hoofdreiziger) {
        this.code = code;
        this.voornaam = voornaam;
        this.achternaam = achternaam;
        this.adres = adres;
        this.postcode = postcode;
        this.plaats = plaats;
        this.land = land;
        this.hoofdreiziger = hoofdreiziger;
    }

    public Reiziger() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getVoornaam() {
        return voornaam;
    }

    public void setVoornaam(String voornaam) {
        this.voornaam = voornaam;
    }

    public String getAchternaam() {
        return achternaam;
    }

    public void setAchternaam(String achternaam) {
        this.achternaam = achternaam;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPlaats() {
        return plaats;
    }

    public void setPlaats(String plaats) {
        this.plaats = plaats;
    }

    public String getLand() {
        return land;
    }

    public void setLand(String land) {
        this.land = land;
    }

    public String getHoofdreiziger() {
        return hoofdreiziger;
    }

    public void setHoofdreiziger(String hoofdreiziger) {
        this.hoofdreiziger = hoofdreiziger;
    }

    @Override
    public String toString() {
        return voornaam + " " + achternaam + " woont in " + plaats;
    }

    public Document toDocument() {
       return new Document("code", code)
                .append("voornaam", voornaam)
                .append("achternaam", achternaam)
                .append("adres", adres)
                .append("postcode", postcode)
                .append("plaats", plaats)
                .append("land", land)
                .append("hoofdreiziger", hoofdreiziger);
    }

    public String toJson() {
        return """
                {
                    "code":"%s",
                    "voornaam":"%s",
                    "achternaam":"%s",
                    "adres":"%s",
                    "postcode":"%s",
                    "plaats":"%s",
                    "land":"%s",
                    "hoofdreiziger":%s
                },
                """.formatted(code, voornaam, achternaam, adres, postcode, plaats, land,
                hoofdreiziger == null ? "null" : ("\"" + hoofdreiziger + "\""));
//        return "{" +
//                "\"code\":\"" + code + "\"," +
//                "\"voornaam\":\"" + voornaam + "\"," +
//                "\"achternaam\":\"" + achternaam + "\"," +
//                "\"adres\":\"" + adres + "\"," +
//                "\"postcode\":\"" + postcode + "\"," +
//                "\"plaats\":\"" + plaats + "\"," +
//                "\"land\":\"" + land + "\"," +
//                "\"hoofdreiziger\":" + (hoofdreiziger == null ? "null" : ("\"" + hoofdreiziger + "\"")) +
//                "}";
    }
}
