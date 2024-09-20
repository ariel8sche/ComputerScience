package aed;

public class Recordatorio {

    public Recordatorio(String mensaje, Fecha fecha, Horario horario) {
        _mensaje = mensaje;
        _fecha = fecha;
        _horario = horario;
    }

    public Horario horario() {
        return _horario;
    }

    public Fecha fecha() {
        return _fecha;
    }

    public String mensaje() {
        return _mensaje;
    }

    @Override
    public String toString() {
        StringBuffer sBuffer = new StringBuffer();

        sBuffer.append(_mensaje);
        sBuffer.append(" ");
        sBuffer.append("@");
        sBuffer.append(" ");
        sBuffer.append(_fecha);
        sBuffer.append(" ");
        sBuffer.append(_horario);

        return sBuffer.toString();
    }

    private String _mensaje;

    private Horario _horario;

    private Fecha _fecha;
}
