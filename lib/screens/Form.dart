main(){
  Form(
    child: ListView(
      children: [
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio(
            groupValue: _character,
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio(
            value: SingingCharacter.jefferson,
            groupValue: _character,
          ),
        ),
      ],
    ),
  ),
}
