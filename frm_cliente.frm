VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frm_cliente 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "CHAT Cliente"
   ClientHeight    =   6270
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7545
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   -1  'True
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6270
   ScaleWidth      =   7545
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmd_desconectar 
      Caption         =   "Desconectar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4200
      TabIndex        =   8
      Top             =   480
      Width           =   1455
   End
   Begin RichTextLib.RichTextBox txt_log 
      Height          =   3615
      Left            =   120
      TabIndex        =   7
      Top             =   960
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   6376
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   3
      TextRTF         =   $"frm_cliente.frx":0000
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox txt_name 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1200
      TabIndex        =   6
      Top             =   120
      Width           =   1815
   End
   Begin MSWinsockLib.Winsock Winsock 
      Left            =   4800
      Top             =   4680
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmd_send 
      Caption         =   "Enviar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6000
      TabIndex        =   4
      Top             =   5400
      Width           =   1335
   End
   Begin VB.TextBox txt_mensaje 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      ScrollBars      =   3  'Both
      TabIndex        =   3
      Top             =   5160
      Width           =   5655
   End
   Begin VB.TextBox txt_IP 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      TabIndex        =   1
      Text            =   "127.0.0.1"
      Top             =   120
      Width           =   2055
   End
   Begin VB.CommandButton cmd_conectar 
      Caption         =   "Conectar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5880
      TabIndex        =   0
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nombre:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   5
      Top             =   120
      Width           =   900
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "IP del Servidor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3720
      TabIndex        =   2
      Top             =   120
      Width           =   1275
   End
End
Attribute VB_Name = "frm_cliente"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd_conectar_Click()
    Winsock.Close
    Winsock.RemoteHost = txt_IP.Text
    Winsock.RemotePort = 60000
    Winsock.Connect
    cmd_conectar.Caption = "Reconectar"
    txt_log.SelText = ""
End Sub

Private Sub cmd_desconectar_Click()
    Winsock.Close
    cmd_conectar.Caption = "Conectar"
End Sub

Private Sub cmd_send_Click()
    If (txt_name.Text = "") Then
        txt_name.BackColor = vbRed
        txt_name.SetFocus
        txt_mensaje.Text = ""
        MsgBox "Ingresa un nombre primero", vbInformation
    Else
        If (txt_mensaje.Text = "") Then
            MsgBox "No puedes enviar mensajes vacios", vbExclamation, ""
            txt_mensaje.SetFocus
        Else
            txt_log.SelColor = vbBlue
            Winsock.SendData txt_name & "(" & Time & "): " & txt_mensaje.Text
            txt_log.SelText = txt_log.SelText & vbCrLf & txt_name & "(" & Time & "): " & txt_mensaje.Text
            txt_mensaje.Text = ""
            txt_mensaje.SetFocus
            txt_log.SelStart = Len(txt_log)
        End If
    End If
End Sub

Private Sub txt_mensaje_KeyPress(KeyAscii As Integer)
    If (KeyAscii = 13) Then
        cmd_send_Click
    End If
End Sub

Private Sub txt_name_LostFocus()
    If (txt_name.Text <> "") Then
        txt_name.BackColor = vbWhite
    End If
End Sub

Private Sub Winsock_DataArrival(ByVal bytesTotal As Long)
    Dim msjrecibido As String
    Winsock.GetData msjrecibido, vbString
    txt_log.SelColor = vbRed
    txt_log.SelText = txt_log.SelText & vbCrLf & msjrecibido
    txt_log.SelStart = Len(txt_log)
End Sub

Private Sub winsock_Connect()
    txt_log.SelText = "Conectado a " & Winsock.RemoteHostIP & vbCrLf
    txt_log.SelText = ""
End Sub
Private Sub winsock_Close()
    Winsock.Close  'Cierra la conexi�n
End Sub
