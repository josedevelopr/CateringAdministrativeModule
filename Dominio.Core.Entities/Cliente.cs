using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{

    public class Cliente    {
        
        [Required]
        [Display(Name ="DNI",Order =0)]
        public string cl_char_dniclie { get; set; }
        [Display(Name = "Id de usuario", Order = 1)]
        public int cl_int_idusu { get; set; }
        [Required]
        [Display(Name = "Nombre", Order = 2)]
        public string cl_vchar_nombre { get; set; }
        [Required]
        [Display(Name = "Apellido", Order = 3)]
        public string cl_vchar_apellido { get; set; }
        [Required]
        [Display(Name = "Sexo", Order = 4)]
        public string cl_char_sexo { get; set; }
        [Required]
        [Display(Name = "RUC", Order = 5)]
        public string cl_char_ruc { get; set; }
        [Required]
        [Display(Name = "Nro telefono", Order = 6)]
        public string cl_char_fono { get; set; }
        [Required]
        [Display(Name = "Direccion", Order = 0)]
        public string cl_vchar_direc { get; set; }
        [Required]
        [Display(Name = "Foto", Order = 0)]
        public string cl_vchar_foto { get; set; }
        [Required]
        [Display(Name = "Correo", Order = 0)]
        public string cl_vchar_correo { get; set; }
    }
}
