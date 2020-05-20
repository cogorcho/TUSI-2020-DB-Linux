insert into MailTel (id, Codigo, telefono, mail)
select e.id, db.CUE_Anexo as Codigo, lower(trim(db.Mail)) as Mail,
concat('(',replace(db.Codigo_de_area,' ',''),')',replace(db.telefono,' ','')) as Telefono
from DatosBase db
inner join Escuela e
 on e.Codigo = db.CUE_Anexo;
